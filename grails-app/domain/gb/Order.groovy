package gb

class Order {

	Long number
	SortedSet orderVoice
	Supplier supplier
	Date orderDate
	Date shipmentDate
	String deliveryType
	
	
	static belongsTo = [group: Group]
	
	static hasMany = [orderVoice: OrderVoice]
		
    static constraints = {
		supplier nullable: false
    }
	
	static mapping = {
        table "gborder"
    }
}
