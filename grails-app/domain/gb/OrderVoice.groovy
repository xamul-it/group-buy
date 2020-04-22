package gb

class OrderVoice {
	Product product
	Date insertDate
	Customer customer
	Integer quantityRequested
	Integer quantityShipped
	String description
	Float estimatedPrice
	Float finalPrice
	
	
	static embedded = ['product']

    static constraints = {
		customer nullable: false
		quantityRequested nullable: true
		description nullable: true
		estimatedPrice nullable: true
		finalPrice nullable: true
    }
}
