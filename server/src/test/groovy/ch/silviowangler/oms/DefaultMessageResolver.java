package ch.silviowangler.oms;

import jakarta.inject.Singleton;
import org.thymeleaf.context.ITemplateContext;
import org.thymeleaf.messageresolver.IMessageResolver;

@Singleton
public class DefaultMessageResolver implements IMessageResolver {

  @Override
  public String getName() {
    return "Yolo";
  }

  @Override
  public Integer getOrder() {
    return 1;
  }

  @Override
  public String resolveMessage(ITemplateContext context, Class<?> origin, String key, Object[] messageParameters) {
    return "Süüüü";
  }

  @Override
  public String createAbsentMessageRepresentation(ITemplateContext context, Class<?> origin, String key, Object[] messageParameters) {
    return "Key «" + key + "» is absent";
  }
}
