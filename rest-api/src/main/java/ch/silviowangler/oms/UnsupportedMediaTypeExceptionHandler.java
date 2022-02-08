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

import static io.micronaut.http.HttpStatus.BAD_REQUEST;

import io.micronaut.context.annotation.Requires;
import io.micronaut.http.HttpRequest;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Produces;
import io.micronaut.http.hateoas.JsonError;
import io.micronaut.http.hateoas.Link;
import io.micronaut.http.server.exceptions.ExceptionHandler;
import jakarta.inject.Singleton;

@Produces
@Singleton
@Requires(classes = {UnsupportedMediaTypeException.class})
public class UnsupportedMediaTypeExceptionHandler
    implements ExceptionHandler<UnsupportedMediaTypeException, HttpResponse> {
  @Override
  public HttpResponse handle(HttpRequest request, UnsupportedMediaTypeException e) {
    JsonError error =
        new JsonError("Invalid request: " + e.getMessage())
            .link(Link.SELF, Link.of(request.getUri()));

    return HttpResponse.<JsonError>status(BAD_REQUEST, e.getMessage()).body(error);
  }
}
