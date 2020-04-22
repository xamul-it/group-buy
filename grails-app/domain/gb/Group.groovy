package gb

class Group {
	String name
	String description
	Address deliveryAddress
	Date creationDate
	List customers
	
	static belongsTo = [group: Group]
	
	static hasMany = [customers: Customer]
    
	static constraints = {
		name size: 5..15, blank: false , nullable: true
		description size: 5..200, blank: true
    }
}
