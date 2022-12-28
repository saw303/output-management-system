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

import gg.jte.TemplateEngine;
import gg.jte.output.Utf8ByteOutput;
import io.micronaut.context.annotation.Requires;
import io.micronaut.context.annotation.Value;
import jakarta.inject.Singleton;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;
import lombok.SneakyThrows;

@Singleton
@Requires(property = "oms.engine.jte.enabled", value = "true")
public class JteTemplateEngineFacade implements TemplateEngineFacade {

  private final TemplateEngine templateEngine;
  private final String omsPrefix;

  public JteTemplateEngineFacade(
      TemplateEngine templateEngine, @Value("${oms.prefix:oms-}") String omsPrefix) {
    this.templateEngine = templateEngine;
    this.omsPrefix = omsPrefix;
  }

  @Override
  @SneakyThrows({IOException.class})
  public ByteArrayOutputStream process(
      TemplateContext templateContext, Instruction instruction, Object bindingObject) {

    ByteArrayOutputStream out = new ByteArrayOutputStream();
    Utf8ByteOutput output = new Utf8ByteOutput();
    templateEngine.render(
        this.omsPrefix + templateContext.templateId().toString(),
        Map.of(
            instruction.getBindingVariableName(),
            bindingObject,
            "locale",
            templateContext.locale()),
        output);
    output.writeTo(out);
    return out;
  }
}
