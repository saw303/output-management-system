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

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import io.micronaut.context.annotation.Bean;
import io.micronaut.context.annotation.Factory;
import io.micronaut.context.annotation.Requires;
import lombok.extern.slf4j.Slf4j;

@Factory
@Requires(property = "oms.engine.jte.enabled", value = "true")
@Slf4j
public class JteTemplateBeanFactory {
  @Bean
  public TemplateEngine templateEngine() {
    TemplateEngine templateEngine = TemplateEngine.createPrecompiled(ContentType.Html);
    templateEngine.setBinaryStaticContent(true);
    return templateEngine;
  }
}
