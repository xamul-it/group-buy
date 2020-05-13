package gb

class Order {

	SortedSet orderVoice
	Supplier supplier
	Date orderDate
	Date shipmentDate
	String deliveryType
	String description

	transient springSecurityService
	
	static belongsTo = [group: Group]
	
	static hasMany = [orderVoice: OrderVoice]
		
    static constraints = {
		supplier nullable: false
		orderVoice nullable: true
		shipmentDate nullable: true
		deliveryType nullable: true
    }
	
	static mapping = {
        table "gborder"
    }
}
