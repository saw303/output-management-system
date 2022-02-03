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

import ch.onstructive.mapping.mapstruct.MicronautMappingConfig;
import ch.silviowangler.oms.domain.Template;
import ch.silviowangler.oms.servicesapi.TemplateDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(config = MicronautMappingConfig.class)
public interface TemplateMapper {

  TemplateDto toTemplateDto(Template template);

  @Mapping(target = "id", ignore = true)
  void toTemplate(TemplateDto templateDto, @MappingTarget Template template);
}
