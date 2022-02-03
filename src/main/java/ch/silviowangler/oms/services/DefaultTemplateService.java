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
package ch.silviowangler.oms.services;

import ch.onstructive.exceptions.NotFoundException;
import ch.silviowangler.oms.domain.Template;
import ch.silviowangler.oms.domain.TemplateRepository;
import ch.silviowangler.oms.servicesapi.TemplateDto;
import ch.silviowangler.oms.servicesapi.TemplateService;
import io.micronaut.transaction.annotation.ReadOnly;
import jakarta.inject.Singleton;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Singleton
@RequiredArgsConstructor
public class DefaultTemplateService implements TemplateService {

  private final TemplateRepository templateRepository;
  private final TemplateMapper templateMapper;

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
}
