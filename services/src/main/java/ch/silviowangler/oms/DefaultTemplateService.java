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

import ch.onstructive.exceptions.NotFoundException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.micronaut.http.MediaType;
import jakarta.inject.Singleton;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;
import lombok.extern.slf4j.Slf4j;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Singleton
@Slf4j
public class DefaultTemplateService implements TemplateService {

  private final ObjectMapper objectMapper;
  private final TemplateEngine templateEngine;
  private final Collection<Instruction> instructions;

  private final PdfProducer pdfProducer;

  public DefaultTemplateService(
      ObjectMapper objectMapper,
      TemplateEngine templateEngine,
      Collection<Instruction> instructions,
      PdfProducer pdfProducer) {
    this.objectMapper = objectMapper;
    this.templateEngine = templateEngine;
    this.instructions = requireNonEmpty(instructions, "instructions");
    this.pdfProducer = pdfProducer;
  }

  @Override
  public ProcessResult process(TemplateContext templateContext) {

    Instruction instruction = findInstruction(templateContext);

    if (!instruction.getSupportedMediaTypes().contains(templateContext.getRequestedOutput())) {
      log.error(
          "Template {} is requested for {} but can only {}",
          templateContext.getTemplateId(),
          templateContext.getRequestedOutput(),
          instruction.getSupportedMediaTypes());
      throw new UnsupportedMediaTypeException(
          templateContext.getRequestedOutput(), instruction.getSupportedMediaTypes());
    }

    Context context = new Context(templateContext.getLocale());

    UUID templateId = templateContext.getTemplateId();
    try {
      Object bindingObject =
          objectMapper.readValue(templateContext.getJsonAsString(), instruction.getBindingClass());
      context.setVariable(instruction.getBindingVariableName(), bindingObject);
      String writerXml = templateEngine.process(templateId.toString(), context);

      if (Objects.equals(templateContext.getRequestedOutput(), MediaType.APPLICATION_PDF_TYPE)) {
        return new ProcessResult(
            templateContext.getRequestedOutput(), pdfProducer.producePdf(writerXml));
      }
      return new ProcessResult(
          templateContext.getRequestedOutput(), writerXml.getBytes(StandardCharsets.UTF_8));

    } catch (JsonProcessingException e) {
      log.error("Failed to process template {}", templateId, e);
      throw new RuntimeException("Failed to process template " + templateId, e);
    }
  }

  private Instruction findInstruction(TemplateContext templateContext) {
    return instructions.stream()
        .filter(i -> templateContext.getTemplateId().equals(i.getId()))
        .findAny()
        .orElseThrow(() -> new NotFoundException("template", templateContext.getTemplateId()));
  }
}
