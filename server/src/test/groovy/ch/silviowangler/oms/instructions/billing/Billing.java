/*
   Copyright 2022 - 2022 Silvio Wangler

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
package ch.silviowangler.oms.instructions.billing;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import javax.money.MonetaryAmount;

public class Billing {

  private Customer customer;

  private String invoiceNumber;
  private LocalDate invoiceDate;
  private String servicePeriod;

  private Period paymentUntil;

  private String esrBase64;

  private List<InvoiceLine> invoiceLines = new ArrayList<>();

  public Customer getCustomer() {
    return customer;
  }

  public void setCustomer(Customer customer) {
    this.customer = customer;
  }

  public String getInvoiceNumber() {
    return invoiceNumber;
  }

  public void setInvoiceNumber(String invoiceNumber) {
    this.invoiceNumber = invoiceNumber;
  }

  public LocalDate getInvoiceDate() {
    return invoiceDate;
  }

  public void setInvoiceDate(LocalDate invoiceDate) {
    this.invoiceDate = invoiceDate;
  }

  public String getServicePeriod() {
    return servicePeriod;
  }

  public void setServicePeriod(String servicePeriod) {
    this.servicePeriod = servicePeriod;
  }

  public Period getPaymentUntil() {
    return paymentUntil;
  }

  public void setPaymentUntil(Period paymentUntil) {
    this.paymentUntil = paymentUntil;
  }

  public List<InvoiceLine> getInvoiceLines() {
    return invoiceLines;
  }

  public void setInvoiceLines(List<InvoiceLine> invoiceLines) {
    this.invoiceLines = invoiceLines;
  }

  public String getEsrBase64() {
    return esrBase64;
  }

  public void setEsrBase64(String esrBase64) {
    this.esrBase64 = esrBase64;
  }

  public static class Customer {

    private String name;
    private String streetLine;
    private String postalCodeAndCity;

    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public String getStreetLine() {
      return streetLine;
    }

    public void setStreetLine(String streetLine) {
      this.streetLine = streetLine;
    }

    public String getPostalCodeAndCity() {
      return postalCodeAndCity;
    }

    public void setPostalCodeAndCity(String postalCodeAndCity) {
      this.postalCodeAndCity = postalCodeAndCity;
    }

    public List<String> toLines() {
      return List.of(name, streetLine, postalCodeAndCity);
    }
  }

  public static class InvoiceLine {

    private String person;
    private String text;
    private MonetaryAmount amount;

    public String getPerson() {
      return person;
    }

    public void setPerson(String person) {
      this.person = person;
    }

    public String getText() {
      return text;
    }

    public void setText(String text) {
      this.text = text;
    }

    public MonetaryAmount getAmount() {
      return amount;
    }

    public void setAmount(MonetaryAmount amount) {
      this.amount = amount;
    }
  }
}
