package gb

class Product {

	String code
	String description
	Float price
	
	static belongsTo = [supplier: Supplier]
	
    static constraints = {
		code nullable:true
		description nullable: false, blank: false, size: 5..255
		supplier nullable:false
		price nullable:true
    }

	String toString() {
		return "code: $code desc: $description price: $price (supplier:${supplier?.id})"
	}
}
