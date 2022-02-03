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

import ch.silviowangler.oms.domain.TemplateRepository;
import jakarta.inject.Singleton;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.Map;
import java.util.UUID;
import org.thymeleaf.IEngineConfiguration;
import org.thymeleaf.cache.ICacheEntryValidity;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.AbstractTemplateResolver;
import org.thymeleaf.templateresource.ITemplateResource;

@Singleton
public class DefaultDatabaseTemplateResolver extends AbstractTemplateResolver {

  private final TemplateRepository templateRepository;

  public DefaultDatabaseTemplateResolver(TemplateRepository templateRepository) {
    this.templateRepository = templateRepository;
    super.setOrder(1);
  }

  @Override
  protected ITemplateResource computeTemplateResource(
      IEngineConfiguration configuration,
      String ownerTemplate,
      String template,
      Map<String, Object> templateResolutionAttributes) {

    return templateRepository
        .findById(UUID.fromString(template))
        .map(
            t ->
                new ITemplateResource() {
                  @Override
                  public String getDescription() {
                    return t.getName();
                  }

                  @Override
                  public String getBaseName() {
                    return template;
                  }

                  @Override
                  public boolean exists() {
                    return true;
                  }

                  @Override
                  public Reader reader() throws IOException {
                    return new StringReader(t.getContent());
                  }

                  @Override
                  public ITemplateResource relative(String relativeLocation) {
                    return this;
                  }
                })
        .orElse(null);
  }

  @Override
  protected TemplateMode computeTemplateMode(
      IEngineConfiguration configuration,
      String ownerTemplate,
      String template,
      Map<String, Object> templateResolutionAttributes) {
    return TemplateMode.TEXT;
  }

  @Override
  protected ICacheEntryValidity computeValidity(
      IEngineConfiguration configuration,
      String ownerTemplate,
      String template,
      Map<String, Object> templateResolutionAttributes) {
    return new ICacheEntryValidity() {
      @Override
      public boolean isCacheable() {
        return false;
      }

      @Override
      public boolean isCacheStillValid() {
        return false;
      }
    };
  }
}
