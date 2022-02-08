package ch.silviowangler.oms

import ch.silviowangler.oms.clients.TemplateClient
import ch.silviowangler.oms.instructions.billing.Billing
import com.fasterxml.jackson.databind.ObjectMapper
import io.micronaut.http.HttpResponse
import io.micronaut.http.MediaType
import io.micronaut.http.client.exceptions.HttpClientResponseException
import io.micronaut.test.extensions.spock.annotation.MicronautTest
import jakarta.inject.Inject
import org.javamoney.moneta.Money
import spock.lang.Shared
import spock.lang.Specification

import java.time.LocalDate
import java.time.Period

import static io.micronaut.http.HttpHeaders.CONTENT_TYPE
import static io.micronaut.http.HttpStatus.BAD_REQUEST
import static io.micronaut.http.HttpStatus.OK
import static io.micronaut.http.MediaType.APPLICATION_PDF_TYPE
import static io.micronaut.http.MediaType.MICROSOFT_EXCEL_OPEN_XML_TYPE
import static io.micronaut.http.MediaType.TEXT_PLAIN
import static io.micronaut.http.MediaType.TEXT_PLAIN_TYPE
import static java.util.Locale.GERMAN

@MicronautTest
class TemplateControllerSpec extends Specification {

  @Inject
  TemplateClient templateClient

  @Inject
  ObjectMapper objectMapper

  @Shared
  Billing billing = new Billing(
    customer: new Billing.Customer(
      name: "Hello AG",
      streetLine: 'Weilerrain 12A',
      postalCodeAndCity: '8090 Zürich'
    ),
    invoiceDate: LocalDate.of(2022, 2, 8),
    invoiceNumber: 'R2D2-202209',
    paymentUntil: Period.ofDays(30),
    invoiceLines: [
      new Billing.InvoiceLine(
        person: 'Peter Parker',
        text: '12 Stunden à CHF 1.-',
        amount: Money.of(12, 'CHF')
      ),
      new Billing.InvoiceLine(
        person: '',
        text: '7.7% MwSt. ',
        amount: Money.of(12, 'CHF').multiply(0.077)
      )
    ],
    esrBase64: 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj48c3ZnIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHZpZXdCb3g9IjAgMCA2NzggMTM4IiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHhtbG5zOnNlcmlmPSJodHRwOi8vd3d3LnNlcmlmLmNvbS8iIHN0eWxlPSJmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlLW1pdGVybGltaXQ6MjsiPjx0ZXh0IHg9Ii0xMS45MDdweCIgeT0iMTA2LjQ0MXB4IiBzdHlsZT0iZm9udC1mYW1pbHk6J0FyaWFsTVQnLCAnQXJpYWwnLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNDguNjk4cHg7Ij5IZWxsbywgeW91LjwvdGV4dD48L3N2Zz4=',
    servicePeriod: 'Januar 2029'
  )

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
    response.body() as String == 'Hello Silvio, date of birth: 1978-11-01\\nLang: de'
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
    HttpResponse response = templateClient.process(invoiceTemplateId, GERMAN, MICROSOFT_EXCEL_OPEN_XML_TYPE, json)

    then:
    HttpClientResponseException ex = thrown(HttpClientResponseException)

    and:
    ex.status == BAD_REQUEST
  }
}
