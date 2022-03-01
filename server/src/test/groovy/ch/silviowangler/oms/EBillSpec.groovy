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

    given:
    // Setup bill
    Bill bill = new Bill();
    bill.setAccount("CH9700700114803110326");
    bill.setAmount(1077.0 as BigDecimal);
    bill.setCurrency("CHF");

    // Set creditor
    Address creditor = new Address();
    creditor.setName("onstructive GmbH");
    creditor.setAddressLine1("Josefstrasse 92");
    creditor.setAddressLine2("8005 Zürich");
    creditor.setCountryCode("CH");
    bill.setCreditor(creditor);

    // more bill data
    //bill.setReference("202203");
    bill.setUnstructuredMessage("Rechnung 202203");

    // Set debtor
    Address debtor = new Address();
    debtor.setName("ZHAW Gesundheit, Institut für Pflege, Frau Irène Ris");
    debtor.setStreet("Technikumstrasse")
    debtor.setHouseNo("71")
    debtor.setPostalCode("8401")
    debtor.setTown("Winterthur")
    debtor.setCountryCode("CH");
    bill.setDebtor(debtor);

    // Set output format
    BillFormat format = bill.getFormat();
    format.setGraphicsFormat(GraphicsFormat.PDF);
    format.setOutputSize(OutputSize.QR_BILL_ONLY);
    format.setLanguage(Language.DE);

    when:
    byte[] svg = QRBill.generate(bill)

    and:
    Path path = File.createTempFile("hello", ".pdf").toPath()
    Files.write(path, svg)

    then:
    noExceptionThrown()
  }
}
