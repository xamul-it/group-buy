package gb

class Group {
	String name
	String description
	Address deliveryAddress
	Date creationDate
	List members
	boolean isPublic
	
	static belongsTo = [owner: User]
	
	static hasMany = [members: User]

	transient springSecurityService

	static constraints = {
		name nullable: false, blank: false, size: 5..20, unique: true,
				validator: { val, obj ->
					(obj.owner.id == obj.springSecurityService.getPrincipal().id ||
							(obj.owner != null && obj.owner.id == obj.springSecurityService.getPrincipal().id)
					)
				}
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
					owner = User.get(springSecurityService.getPrincipal().id)
				}
			}
			creationDate = new Date()
		}
		if (deliveryAddress!=null) deliveryAddress.countryCode="IT"
	}
}
