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
import java.util.Set;
import java.util.stream.Collectors;

public class UnsupportedMediaTypeException extends RuntimeException {

  private final MediaType wanted;
  private final Set<MediaType> needed;

  public UnsupportedMediaTypeException(MediaType wanted, MediaType needed) {
    this(wanted, Set.of(needed));
  }

  public UnsupportedMediaTypeException(MediaType wanted, Set<MediaType> needed) {
    super(
        "Template only supports media type "
            + needed.stream().map(MediaType::getName).collect(Collectors.joining()));
    this.wanted = wanted;
    this.needed = needed;
  }

  public MediaType getWanted() {
    return wanted;
  }

  public Set<MediaType> getNeeded() {
    return needed;
  }
}
