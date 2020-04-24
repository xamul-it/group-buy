package gb

class Group {
	String name
	String description
	Address deliveryAddress
	Date creationDate
	List members
	boolean isPublic
	
	static belongsTo = [customer: Customer]
	
	static hasMany = [members: Customer]
    
	static constraints = {
		name size: 5..15, blank: false , nullable: true
		description size: 5..200, blank: true
    }
	static mapping = {
        table "gbgroup"
    }
	static embedded = ['deliveryAddress']
}
