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

import io.micronaut.http.MediaType;

public class TemplateConfig {

  private final MediaType mediaType;
  private final String templateName;
  private final Class targetClass;

  public TemplateConfig(MediaType mediaType, String templateName, Class targetClass) {
    this.mediaType = mediaType;
    this.templateName = templateName;
    this.targetClass = targetClass;
  }

  public MediaType getMediaType() {
    return this.mediaType;
  }

  public String getTemplateName() {
    return this.templateName;
  }

  public Class getTargetClass() {
    return this.targetClass;
  }
}
