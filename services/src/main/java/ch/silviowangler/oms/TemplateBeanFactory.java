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

import static ch.onstructive.util.Assertions.requireNonEmpty;

import io.micronaut.context.annotation.Bean;
import io.micronaut.context.annotation.Factory;
import io.micronaut.context.annotation.Value;
import java.util.Set;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

/** @author Silvio Wangler (silvio.wangler@onstructive.ch) */
@Factory
public class TemplateBeanFactory {

  @Bean
  public TemplateEngine templateEngine(Set<ITemplateResolver> templateResolvers) {
    TemplateEngine templateEngine = new TemplateEngine();
    templateEngine.setTemplateResolvers(requireNonEmpty(templateResolvers, "templateResolvers"));
    return templateEngine;
  }

  /**
   * Build the default template resolver which uses tries to find the templates on the classpath.
   * This resolver has the order of 10 in order that other custom resolvers can replace this one.
   *
   * <p>The default template should follow this patter <code>oms-[template-id].template</code>. The
   * prefix and suffix can be overridden in the configuration.
   *
   * @param prefix define the prefix.
   * @param suffix define the suffix.
   * @return a template resolver that searches for templates on the classpath.
   */
  @Bean
  public ClassLoaderTemplateResolver templateResolver(
      @Value("${oms.prefix:oms-}") String prefix, @Value("${oms.suffix:.template}") String suffix) {
    ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
    templateResolver.setPrefix(prefix);
    templateResolver.setSuffix(suffix);

    // make sure this resolver has a low priority
    templateResolver.setOrder(10);
    return templateResolver;
  }
}
