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

import ch.silviowangler.oms.DemoBindingObject;
import ch.silviowangler.oms.servicesapi.TemplateConfig;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Header;
import io.micronaut.http.annotation.Post;
import io.micronaut.scheduling.TaskExecutors;
import io.micronaut.scheduling.annotation.ExecuteOn;
import java.util.Locale;
import lombok.RequiredArgsConstructor;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Controller("/api/v1/templates")
@RequiredArgsConstructor
public class OmsControllerV1 {

  private final TemplateEngine templateEngine;
  private final ObjectMapper objectMapper;

  @Post("/{templateId}/process")
  @ExecuteOn(TaskExecutors.SCHEDULED)
  public HttpResponse renderTemplate(
      String templateId, @Header Locale acceptLanguage, @Body String body) {

    TemplateConfig templateConfig =
        new TemplateConfig(MediaType.TEXT_PLAIN_TYPE, templateId, DemoBindingObject.class);
    Context context = new Context(acceptLanguage);

    try {
      context.setVariable(
          "document", objectMapper.readValue(body, templateConfig.getTargetClass()));
    } catch (JsonProcessingException e) {
      return HttpResponse.serverError();
    }

    String process = templateEngine.process(templateConfig.getTemplateName(), context);
    return HttpResponse.ok().contentType(templateConfig.getMediaType()).body(process);
  }
}
