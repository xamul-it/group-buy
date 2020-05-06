package gb

class Group {
	String name
	String description
	Address deliveryAddress
	Date creationDate
	List members
	boolean isPublic
	
	static belongsTo = [owner: Customer]
	
	static hasMany = [members: Customer]

	transient springSecurityService

	static constraints = {
		name size: 5..15, blank: false , nullable: true
		description size: 5..200, blank: true
    }
	static mapping = {
        table 'gbgroup'
    }
	static embedded = ['deliveryAddress']

	def beforeValidate () {
		if (id==null) {
			if (springSecurityService.isLoggedIn()) {
				if(owner == null){
					//TODO sistemare la gestione dell'owner -> chi genera il gruppo deve essere un customer
					// o glielo deve associare
					owner = new Customer();
					owner.deliveryAddress = deliveryAddress
					owner.user = User.get(springSecurityService.getPrincipal().id)
				}
			}
			creationDate = new Date()
		}
		if (deliveryAddress!=null) deliveryAddress.countryCode="IT"
	}
}
