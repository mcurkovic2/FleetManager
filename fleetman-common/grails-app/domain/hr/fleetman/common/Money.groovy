package hr.fleetman.common

class Money {

    static constraints = {
    }
	
	
	public Money(BigDecimal amount, Currency currency) {
		this.amount = amount
		this.currency = currency
	}
	Currency currency
	BigDecimal amount
}
