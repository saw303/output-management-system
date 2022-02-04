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
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Delete;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;
import io.micronaut.http.annotation.Put;
import io.micronaut.scheduling.TaskExecutors;
import io.micronaut.scheduling.annotation.ExecuteOn;
import java.util.UUID;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;

@Controller("/api/v1/templates")
@RequiredArgsConstructor
public class TemplateManagementController {

  private final TemplateService templateService;
  private final RestApiMapper restApiMapper;

  @Get
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public Iterable<TemplateModel> getAllTemplates() {
    return templateService.findAllTemplates().stream()
        .map(restApiMapper::toTemplateModel)
        .collect(Collectors.toList());
  }

  @Get("/{id}")
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public TemplateModel getTemplate(UUID id) {
    return templateService
        .findTemplate(id)
        .map(restApiMapper::toTemplateModel)
        .orElseThrow(() -> new NotFoundException("template", id));
  }

  @Delete("/{id}")
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public HttpResponse<?> deleteTemplate(UUID id) {
    templateService.deleteTemplate(id);
    return HttpResponse.noContent();
  }

  @Post
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public TemplateModel add(@Body TemplateModel template) {
    return restApiMapper.toTemplateModel(
        templateService.saveTemplate(restApiMapper.toTemplateDto(template)));
  }

  @Put("/{id}")
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public TemplateModel update(UUID id, @Body TemplateModel template) {
    return restApiMapper.toTemplateModel(
        templateService.saveTemplate(restApiMapper.toTemplateDto(template)));
  }
}
