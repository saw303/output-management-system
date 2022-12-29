package ch.silviowangler.oms

import ch.silviowangler.oms.clients.TemplateClient
import ch.silviowangler.oms.instructions.billing.Billing
import com.fasterxml.jackson.databind.ObjectMapper
import io.micronaut.context.annotation.Property
import io.micronaut.http.HttpResponse
import io.micronaut.http.MediaType
import io.micronaut.http.client.exceptions.HttpClientResponseException
import io.micronaut.test.extensions.spock.annotation.MicronautTest
import jakarta.inject.Inject
import spock.lang.Shared
import spock.lang.Specification

import java.time.LocalDate

import static io.micronaut.http.HttpHeaders.CONTENT_TYPE
import static io.micronaut.http.HttpStatus.BAD_REQUEST
import static io.micronaut.http.HttpStatus.OK
import static io.micronaut.http.MediaType.APPLICATION_PDF_TYPE
import static io.micronaut.http.MediaType.MICROSOFT_EXCEL_OPEN_XML_TYPE
import static io.micronaut.http.MediaType.TEXT_PLAIN
import static io.micronaut.http.MediaType.TEXT_PLAIN_TYPE
import static java.util.Locale.GERMAN

@MicronautTest
@Property(name = "oms.engine.jte.enabled", value = "true")
class JteTemplateControllerSpec extends Specification {

  @Inject
  TemplateClient templateClient

  @Inject
  ObjectMapper objectMapper

  @Shared
  Billing billing = TestData.BILLING

  @Shared
  UUID invoiceTemplateId = UUID.fromString('39906837-7af4-4330-84df-e3a8b329e4d5')

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
    response.body() as String == 'Hello Silvio, date of birth: 1978-11-01, Lang: de\n'
  }

  void "Render onstructive invoice"() {

    given:
    MediaType mediaType = MediaType.of('application/vnd.oasis.opendocument.text')

    and:
    String json = objectMapper.writeValueAsString(billing)

    when:
    HttpResponse response = templateClient.process(invoiceTemplateId, GERMAN, mediaType, json)

    String body = response.getBody(String).get()

    File f = File.createTempFile("hello", ".fodt")
    f.write body
    println "File is at ${f.absolutePath}"

    then:
    response.header(CONTENT_TYPE) == mediaType.name

    and:
    response.status == OK

    and:
    noExceptionThrown()
  }

  void "Render onstructive invoice as PDF"() {

    given:
    String json = objectMapper.writeValueAsString(billing)

    when:
    HttpResponse response = templateClient.process(invoiceTemplateId, GERMAN, APPLICATION_PDF_TYPE, json)

    then:
    noExceptionThrown()

    and:
    response.status == OK
  }

  void "Render onstructive invoice as Excel which is not supported"() {

    given:
    String json = objectMapper.writeValueAsString(billing)

    when:
    templateClient.process(invoiceTemplateId, GERMAN, MICROSOFT_EXCEL_OPEN_XML_TYPE, json)

    then:
    HttpClientResponseException ex = thrown(HttpClientResponseException)

    and:
    ex.status == BAD_REQUEST
  }
}
