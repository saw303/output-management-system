package ch.silviowangler.oms

import ch.silviowangler.oms.clients.TemplateClient
import ch.silviowangler.oms.restapi.TemplateModel
import io.micronaut.http.MediaType
import io.micronaut.test.extensions.spock.annotation.MicronautTest
import jakarta.inject.Inject
import spock.lang.Specification

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
                contentType: MediaType.TEXT_HTML,
                content: '<html><head><title>Hello</title></head></html>'
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
        templateClient.deleteTemplate(modelAfter.getId())

        then:
        templateClient.getAllTemplates().isEmpty()
    }

}
