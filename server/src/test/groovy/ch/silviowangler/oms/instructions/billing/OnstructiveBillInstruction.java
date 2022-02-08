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
package ch.silviowangler.oms.instructions.billing;

import static io.micronaut.http.MediaType.APPLICATION_PDF_TYPE;

import ch.silviowangler.oms.Instruction;
import io.micronaut.http.MediaType;
import jakarta.inject.Singleton;
import java.util.Set;
import java.util.UUID;

@Singleton
public class OnstructiveBillInstruction implements Instruction {

  private static final Set<MediaType> SUPPORTED_TYPES =
      Set.of(MediaType.of("application/vnd.oasis.opendocument.text"), APPLICATION_PDF_TYPE);

  @Override
  public Class<?> getBindingClass() {
    return Billing.class;
  }

  @Override
  public Set<MediaType> getSupportedMediaTypes() {
    return SUPPORTED_TYPES;
  }

  @Override
  public UUID getId() {
    return UUID.fromString("39906837-7af4-4330-84df-e3a8b329e4d5");
  }
}
