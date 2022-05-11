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
import lombok.extern.slf4j.Slf4j;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.dialect.IDialect;
import org.thymeleaf.extras.java8time.dialect.Java8TimeDialect;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

/**
 * @author Silvio Wangler (silvio.wangler@onstructive.ch)
 */
@Factory
@Slf4j
public class TemplateBeanFactory {

  @Bean
  public TemplateEngine templateEngine(
      Set<ITemplateResolver> templateResolvers, Set<IDialect> dialects) {
    TemplateEngine templateEngine = new TemplateEngine();
    templateEngine.addDialect(new Java8TimeDialect());

    if (dialects != null) {
      for (IDialect dialect : dialects) {
        log.debug(
            "Applying Thymeleaf dialect '{}' (class: '{}')",
            dialect.getName(),
            dialect.getClass().getCanonicalName());
        templateEngine.addDialect(dialect);
      }
    }

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
  public ClassLoaderTemplateResolver libreOfficeTemplateResolver(
      @Value("${oms.prefix:oms-}") String prefix, @Value("${oms.suffix:.fodt}") String suffix) {
    ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
    templateResolver.setPrefix(prefix);
    templateResolver.setSuffix(suffix);

    // make sure this resolver has a low priority
    templateResolver.setOrder(10);
    templateResolver.setTemplateMode(TemplateMode.XML);
    templateResolver.setCheckExistence(true);
    return templateResolver;
  }

  /**
   * Template resolver for HTML documents.
   *
   * @param prefix
   * @return
   */
  @Bean
  public ClassLoaderTemplateResolver htmlTemplateResolver(
      @Value("${oms.prefix:oms-}") String prefix) {
    ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
    templateResolver.setPrefix(prefix);
    templateResolver.setSuffix(".html");

    // make sure this resolver has a low priority
    templateResolver.setOrder(11);
    templateResolver.setTemplateMode(TemplateMode.HTML);
    templateResolver.setCheckExistence(true);
    return templateResolver;
  }
}
