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

import static io.micronaut.http.MediaType.APPLICATION_PDF;

import io.micronaut.http.HttpResponse;
import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Header;
import io.micronaut.http.annotation.Post;
import io.micronaut.http.annotation.Produces;
import io.micronaut.scheduling.TaskExecutors;
import io.micronaut.scheduling.annotation.ExecuteOn;
import java.util.Locale;
import java.util.UUID;
import lombok.RequiredArgsConstructor;

@Controller("/api/v1/templates")
@RequiredArgsConstructor
public class OmsControllerV1 {

  private final TemplateService templateService;

  @Post("/{templateId}")
  @Produces(value = {MediaType.ALL})
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public HttpResponse renderTemplate(
      UUID templateId,
      @Header Locale acceptLanguage,
      @Header(defaultValue = APPLICATION_PDF) MediaType accept,
      @Body String body) {

    ProcessResult processResult =
        templateService.process(new TemplateContext(templateId, acceptLanguage, body, accept));
    return HttpResponse.ok().contentType(accept).body(processResult.getContent());
  }
}
