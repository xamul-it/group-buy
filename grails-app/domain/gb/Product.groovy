package gb

class Product {
	String code
	String description
	Float price
	
	static belongsTo = [supplier: Supplier]
	
    static constraints = {
		description nullable: false, blank: false, size: 5..150
		supplier nullable:false
    }
}
