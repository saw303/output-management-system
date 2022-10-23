/*
   Copyright 2022 - 2022 Silvio Wangler

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
package ch.silviowangler.oms;

import static ch.onstructive.util.Assertions.requireNonEmpty;
import static org.apache.pdfbox.multipdf.PDFMergerUtility.DocumentMergeMode.OPTIMIZE_RESOURCES_MODE;

import ch.onstructive.exceptions.NotFoundException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.micronaut.http.MediaType;
import jakarta.inject.Singleton;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;
import lombok.extern.slf4j.Slf4j;
import org.apache.pdfbox.io.MemoryUsageSetting;
import org.apache.pdfbox.multipdf.PDFMergerUtility;

@Singleton
@Slf4j
public class DefaultTemplateService implements TemplateService {

  private final ObjectMapper objectMapper;
  private final TemplateEngineFacade templateEngineFacade;
  private final Collection<Instruction> instructions;

  private final PdfProducer pdfProducer;

  public DefaultTemplateService(
      ObjectMapper objectMapper,
      TemplateEngineFacade templateEngineFacade,
      Collection<Instruction> instructions,
      PdfProducer pdfProducer) {
    this.objectMapper = objectMapper;
    this.templateEngineFacade = templateEngineFacade;
    this.instructions = requireNonEmpty(instructions, "instructions");
    this.pdfProducer = pdfProducer;
  }

  @Override
  public ProcessResult process(TemplateContext templateContext) {

    Instruction instruction = findInstruction(templateContext);

    if (!instruction.getSupportedMediaTypes().contains(templateContext.requestedOutput())) {
      log.error(
          "Template {} is requested for {} but can only {}",
          templateContext.templateId(),
          templateContext.requestedOutput(),
          instruction.getSupportedMediaTypes());
      throw new UnsupportedMediaTypeException(
          templateContext.requestedOutput(), instruction.getSupportedMediaTypes());
    }

    UUID templateId = templateContext.templateId();
    try {
      Object bindingObject =
          objectMapper.readValue(templateContext.jsonAsString(), instruction.getBindingClass());

      if (bindingObject.getClass().isArray()) {

        Object[] bindingObjects = (Object[]) bindingObject;

        try (ByteArrayOutputStream destStream = new ByteArrayOutputStream()) {
          PDFMergerUtility mergerUtility = new PDFMergerUtility();
          mergerUtility.setDestinationStream(destStream);
          mergerUtility.setDocumentMergeMode(OPTIMIZE_RESOURCES_MODE);

          for (Object b : bindingObjects) {
            byte[] content = process(templateContext, instruction, b);
            mergerUtility.addSource(new ByteArrayInputStream(content));
          }
          mergerUtility.mergeDocuments(MemoryUsageSetting.setupMainMemoryOnly());
          return new ProcessResult(templateContext.requestedOutput(), destStream.toByteArray());
        } catch (IOException e) {
          log.error("Unable to process document", e);
          throw new RuntimeException("Failed to process template " + templateId, e);
        }
      } else {
        byte[] content = process(templateContext, instruction, bindingObject);
        return new ProcessResult(templateContext.requestedOutput(), content);
      }
    } catch (JsonProcessingException e) {
      log.error("Failed to process template {}", templateId, e);
      throw new RuntimeException("Failed to process template " + templateId, e);
    }
  }

  private byte[] process(
      TemplateContext templateContext, Instruction instruction, Object bindingObject) {

    byte[] content = templateEngineFacade.process(templateContext, instruction, bindingObject);

    if (Objects.equals(templateContext.requestedOutput(), MediaType.APPLICATION_PDF_TYPE)) {
      return pdfProducer.producePdf(content);
    }
    return content;
  }

  private Instruction findInstruction(TemplateContext templateContext) {
    return instructions.stream()
        .filter(i -> templateContext.templateId().equals(i.getId()))
        .findAny()
        .orElseThrow(() -> new NotFoundException("template", templateContext.templateId()));
  }
}
