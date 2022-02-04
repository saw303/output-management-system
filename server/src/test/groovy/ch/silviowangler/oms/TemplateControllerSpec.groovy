package ch.silviowangler.oms

import ch.silviowangler.oms.clients.TemplateClient
import io.micronaut.http.HttpHeaders
import io.micronaut.http.HttpResponse
import io.micronaut.http.MediaType
import io.micronaut.test.extensions.spock.annotation.MicronautTest
import jakarta.inject.Inject
import spock.lang.Specification

import static io.micronaut.http.HttpHeaders.CONTENT_TYPE
import static io.micronaut.http.MediaType.TEXT_PLAIN
import static io.micronaut.http.MediaType.TEXT_PLAIN
import static io.micronaut.http.MediaType.TEXT_PLAIN_TYPE
import static java.util.Locale.GERMAN

@MicronautTest
class TemplateControllerSpec extends Specification {

    @Inject
    TemplateClient templateClient

    void 'Initially there are not templates'() {
        expect:
        templateClient.getAllTemplates().isEmpty()
    }

    void 'CRUD play with templates'() {

        given:
        TemplateModel modelBefore = new TemplateModel(
                name: 'Silvios Template',
                contentType: TEXT_PLAIN,
                content: 'Hello!'
        )

        when:
        TemplateModel modelAfter = templateClient.create(modelBefore)

        then:
        noExceptionThrown()

        and:
        verifyAll {
            with(modelAfter) {
                id
                version == 0
                name == modelBefore.name
                content == modelBefore.content
                contentType == modelBefore.contentType
            }
        }

        and:
        templateClient.getAllTemplates().size() == 1

        when:
        modelAfter.name = 'Angelas Template'

        and:
        modelAfter = templateClient.update(modelAfter.getId(), modelAfter)

        then:
        noExceptionThrown()

        and:
        verifyAll {
            with(modelAfter) {
                id
                version == 0
                name == 'Angelas Template'
                content == modelBefore.content
                contentType == modelBefore.contentType
            }
        }

        when:
        HttpResponse response = templateClient.process(modelAfter.getId(), GERMAN, TEXT_PLAIN_TYPE, "{}")

        then:
        response.header(CONTENT_TYPE) == TEXT_PLAIN

        and:
        response.body() as String == 'Hello!'

        when:
        templateClient.deleteTemplate(modelAfter.getId())

        then:
        templateClient.getAllTemplates().isEmpty()
    }
}
