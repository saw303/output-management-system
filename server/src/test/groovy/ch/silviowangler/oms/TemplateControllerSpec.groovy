package ch.silviowangler.oms

import ch.silviowangler.oms.clients.TemplateClient
import com.fasterxml.jackson.databind.ObjectMapper
import io.micronaut.http.HttpResponse
import io.micronaut.test.extensions.spock.annotation.MicronautTest
import jakarta.inject.Inject
import spock.lang.Specification

import java.time.LocalDate

import static io.micronaut.http.HttpHeaders.CONTENT_TYPE
import static io.micronaut.http.MediaType.TEXT_PLAIN
import static io.micronaut.http.MediaType.TEXT_PLAIN_TYPE
import static java.util.Locale.GERMAN

@MicronautTest
class TemplateControllerSpec extends Specification {

  @Inject
  TemplateClient templateClient

  @Inject
  ObjectMapper objectMapper

  void 'Render template'() {

    given:
    UUID id = UUID.fromString('9b8af32f-0538-4f8f-b19e-a5deb5e23d0a')

    and:
    String json = objectMapper.writeValueAsString([
      name: 'Silvio',
      dob : LocalDate.of(1978, 11, 1)
    ])

    when:
    HttpResponse response = templateClient.process(id, GERMAN, TEXT_PLAIN_TYPE, json)

    then:
    response.header(CONTENT_TYPE) == TEXT_PLAIN

    and:
    response.body() as String == 'Hello Silvio, date of birth: 1978-11-01\\nLang: de'
  }
}
