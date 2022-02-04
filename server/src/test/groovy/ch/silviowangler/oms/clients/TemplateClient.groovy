package ch.silviowangler.oms.clients

import ch.silviowangler.oms.TemplateModel
import io.micronaut.http.HttpResponse
import io.micronaut.http.annotation.Body
import io.micronaut.http.annotation.Delete
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Post
import io.micronaut.http.annotation.Put
import io.micronaut.http.client.annotation.Client

@Client("/api/v1/templates")
interface TemplateClient {

    @Get
    Iterable<TemplateModel> getAllTemplates()

    @Get("/{id}")
    TemplateModel getTemplate(UUID id)

    @Delete("/{id}")
    HttpResponse<?> deleteTemplate(UUID id)

    @Post
    TemplateModel create(@Body TemplateModel template)

    @Put("/{id}")
    TemplateModel update(UUID id, @Body TemplateModel template)

}
