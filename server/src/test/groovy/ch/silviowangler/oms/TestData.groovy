package ch.silviowangler.oms

import ch.silviowangler.oms.instructions.billing.Billing
import org.javamoney.moneta.Money

import java.time.LocalDate
import java.time.Period

abstract class TestData {

  public static final Billing BILLING = new Billing(
    customer: new Billing.Customer(
      name: "Hello AG",
      streetLine: 'Weilerrain 12A',
      postalCodeAndCity: '8090 Zürich'
    ),
    invoiceDate: LocalDate.of(2022, 2, 8),
    invoiceNumber: 'R2D2-202209',
    paymentUntil: Period.ofDays(30),
    invoiceLines: [
      new Billing.InvoiceLine(
        person: 'Peter Parker',
        text: '12 Stunden à CHF 1.-',
        amount: Money.of(12, 'CHF')
      ),
      new Billing.InvoiceLine(
        person: '',
        text: '7.7% MwSt. ',
        amount: Money.of(12, 'CHF').multiply(0.077)
      )
    ],
    esrBase64: 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj48c3ZnIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHZpZXdCb3g9IjAgMCA2NzggMTM4IiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHhtbG5zOnNlcmlmPSJodHRwOi8vd3d3LnNlcmlmLmNvbS8iIHN0eWxlPSJmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlLW1pdGVybGltaXQ6MjsiPjx0ZXh0IHg9Ii0xMS45MDdweCIgeT0iMTA2LjQ0MXB4IiBzdHlsZT0iZm9udC1mYW1pbHk6J0FyaWFsTVQnLCAnQXJpYWwnLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNDguNjk4cHg7Ij5IZWxsbywgeW91LjwvdGV4dD48L3N2Zz4=',
    servicePeriod: 'Januar 2029'
  )
}
