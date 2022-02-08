package ch.silviowangler.oms.instructions

import ch.silviowangler.oms.Instruction
import groovy.transform.Canonical
import io.micronaut.http.MediaType
import jakarta.inject.Singleton

import java.time.LocalDate

@Singleton
class HelloInstruction implements Instruction {

  @Override
  Set<MediaType> getSupportedMediaTypes() {
    return [MediaType.TEXT_PLAIN_TYPE] as Set
  }

  @Override
  Class getBindingClass() {
    return MyBinding
  }

  @Override
  UUID getId() {
    return UUID.fromString('9b8af32f-0538-4f8f-b19e-a5deb5e23d0a')
  }

  @Canonical
  static class MyBinding {
    String name
    LocalDate dob
  }
}
