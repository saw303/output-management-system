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

import jakarta.inject.Singleton;
import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import lombok.RequiredArgsConstructor;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Singleton
@RequiredArgsConstructor
public class ThymeleafTemplateEngineFacade implements TemplateEngineFacade {

  private final TemplateEngine templateEngine;

  @Override
  public byte[] process(
      TemplateContext templateContext, Instruction instruction, Object bindingObject) {

    ByteArrayOutputStream out = new ByteArrayOutputStream();
    Writer writer = new OutputStreamWriter(out);

    Context context = new Context(templateContext.locale());
    context.setVariable(instruction.getBindingVariableName(), bindingObject);
    templateEngine.process(templateContext.templateId().toString(), context, writer);

    return out.toByteArray();
  }
}
