package ch.silviowangler.oms.clients


import io.micronaut.http.HttpResponse
import io.micronaut.http.MediaType
import io.micronaut.http.annotation.Body
import io.micronaut.http.annotation.Consumes
import io.micronaut.http.annotation.Header
import io.micronaut.http.annotation.Post
import io.micronaut.http.client.annotation.Client

import static io.micronaut.http.MediaType.APPLICATION_PDF
import static io.micronaut.http.MediaType.TEXT_PLAIN

@Client("/api/v1/templates")
interface TemplateClient {

    @Post("/{id}/process")
    @Consumes(value = [APPLICATION_PDF, TEXT_PLAIN])
    HttpResponse<?> process(UUID id, @Header Locale acceptLanguage, @Header MediaType accept, @Body String body)
}
