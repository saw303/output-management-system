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
package ch.silviowangler.oms.restapi;

import ch.onstructive.mapping.mapstruct.MicronautMappingConfig;
import ch.silviowangler.oms.servicesapi.TemplateDto;
import io.micronaut.http.MediaType;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(config = MicronautMappingConfig.class)
public interface RestApiMapper {

  @Mapping(target = "contentType", source = "mediaType")
  TemplateModel toTemplateModel(TemplateDto templateDto);

  @InheritInverseConfiguration
  TemplateDto toTemplateDto(TemplateModel templateModel);

  default MediaType toMediaType(String s) {
    return MediaType.of(s);
  }

  default String fromMediaType(MediaType mediaType) {
    return mediaType.getName();
  }
}
