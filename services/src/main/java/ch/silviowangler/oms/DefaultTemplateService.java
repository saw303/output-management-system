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

import ch.onstructive.exceptions.NotFoundException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.micronaut.transaction.annotation.ReadOnly;
import jakarta.inject.Singleton;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Singleton
@RequiredArgsConstructor
@Slf4j
public class DefaultTemplateService implements TemplateService {

  private final TemplateRepository templateRepository;
  private final TemplateMapper templateMapper;
  private final ObjectMapper objectMapper;
  private final TemplateEngine templateEngine;

  @Override
  @ReadOnly
  public List<TemplateDto> findAllTemplates() {
    return templateRepository.findAll().stream()
        .map(templateMapper::toTemplateDto)
        .collect(Collectors.toList());
  }

  @Override
  @ReadOnly
  public Optional<TemplateDto> findTemplate(UUID templateId) {
    return templateRepository.findById(templateId).map(templateMapper::toTemplateDto);
  }

  @Override
  @Transactional
  public TemplateDto saveTemplate(TemplateDto templateDto) {

    Template template;
    if (templateDto.getId() == null) {
      template = new Template();
    } else {
      template =
          templateRepository
              .findById(templateDto.getId())
              .orElseThrow(() -> new NotFoundException("template", templateDto.getId()));
    }

    templateMapper.toTemplate(templateDto, template);
    template = templateRepository.save(template);
    return templateMapper.toTemplateDto(template);
  }

  @Override
  @Transactional
  public void deleteTemplate(UUID templateId) {
    this.templateRepository.deleteById(templateId);
  }

  @Override
  public ProcessResult process(TemplateContext templateContext) {

    Template template =
        templateRepository
            .findById(templateContext.getTemplateId())
            .orElseThrow(() -> new NotFoundException("template", templateContext.getTemplateId()));

    Context context = new Context(templateContext.getLocale());

    try {
      context.setVariable(
          "document", objectMapper.readValue(templateContext.getJsonAsString(), HashMap.class));
      return new ProcessResult(
          template.getMediaType(), templateEngine.process(template.getId().toString(), context));
    } catch (JsonProcessingException e) {
      log.error("Failed to process template {}", template.getId(), e);
      throw new RuntimeException("Failed to process template " + template.getId(), e);
    }
  }
}
