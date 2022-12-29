@import ch.silviowangler.oms.instructions.billing.MyBinding
@import java.util.Locale
@param MyBinding document
@param Locale locale
Hello ${document.getName()}, date of birth: ${ document.getDob().toString()}, Lang: ${locale.getLanguage()}
