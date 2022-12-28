package ch.silviowangler.oms.instructions

import ch.silviowangler.oms.Instruction
import ch.silviowangler.oms.instructions.billing.MyBinding
import io.micronaut.http.MediaType
import jakarta.inject.Singleton

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
}
