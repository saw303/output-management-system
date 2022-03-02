package ch.silviowangler.oms

import net.codecrete.qrbill.generator.Address
import net.codecrete.qrbill.generator.Bill
import net.codecrete.qrbill.generator.BillFormat
import net.codecrete.qrbill.generator.GraphicsFormat
import net.codecrete.qrbill.generator.Language
import net.codecrete.qrbill.generator.OutputSize
import net.codecrete.qrbill.generator.QRBill
import spock.lang.Specification

import java.nio.file.Files
import java.nio.file.Path

class EBillSpec extends Specification{

  void "Create an E-Bill"() {

    given: 'Setup bill'
    Bill bill = new Bill();
    bill.setAccount("CH16 8080 8001 5747 8783 2");
    bill.setAmount(60 as BigDecimal);
    bill.setCurrency("CHF");

    and: 'Set creditor'
    Address creditor = new Address();
    creditor.setName("ZSC Supporter");
    creditor.setAddressLine1("8050 Zürich");
    creditor.setAddressLine2("-");
    creditor.setCountryCode("CH");
    bill.setCreditor(creditor);

    and: 'more bill data'
    bill.setUnstructuredMessage("Rechnung T-1234");

    and: 'Set debtor'
    Address debtor = new Address();
    debtor.setName("Juan Carlo Sperber");
    debtor.setStreet("Chüngstrasse")
    debtor.setHouseNo("12")
    debtor.setPostalCode("8424")
    debtor.setTown("Embrach")
    debtor.setCountryCode("CH");
    bill.setDebtor(debtor);

    and: 'Set output format'
    BillFormat format = bill.getFormat();
    format.setGraphicsFormat(GraphicsFormat.PNG);
    format.setOutputSize(OutputSize.QR_BILL_ONLY);
    format.setLanguage(Language.DE);

    when: 'creating the Swiss QR-Code'
    byte[] qrCodeImage = QRBill.generate(bill)

    and:
    Path path = File.createTempFile("hello", ".png").toPath()
    Files.write(path, qrCodeImage)

    then:
    noExceptionThrown()
  }
}
