package gb

class Group {
	String name
	String description
	Address deliveryAddress
	Date creationDate
	List members
	boolean publicGroup
	
	static belongsTo = [owner: User]
	
	static hasMany = [members: User]

	@Autowired
	transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

	static constraints = {
		name nullable: false, blank: false, size: 5..20, unique: true,
				validator: { val, obj ->
					obj.springSecurityService && (obj.owner.id == obj.springSecurityService.getPrincipal().id ||
							(obj.owner != null && obj.owner.id == obj.springSecurityService.getPrincipal().id)
					)
				}
		description size: 5..200, blank: true
    }
	static mapping = {
        table "gbgroup"
		owner fetch: 'join'
	}
	static embedded = ['deliveryAddress']

	def beforeValidate () {
		if (id==null) {
			if (springSecurityService && springSecurityService.isLoggedIn()) {
				if(owner == null){
					//TODO sistemare la gestione dell'owner -> chi genera il gruppo deve essere un customer
					// o glielo deve associare
//					owner = User.get(springSecurityService.getPrincipal().id)
					owner = springSecurityService.getCurrentUser()
				}
			}
			creationDate = new Date()
		}
		if (deliveryAddress!=null) deliveryAddress.countryCode="IT"
		log.debug "publicGroup:" + publicGroup + "****"
			log.debug "metto a false il public"
	}

	def String toString(){
		String s = new String( "["
		+ " name: " + name
		+ ", description: " + description
		+ ", deliveryAddress: " + deliveryAddress.toString()
		+ ", creationDate: " + creationDate.toString()
		+ ", publicGroup: " + publicGroup
		+ ", owner: " + owner.username
		+ "]")
		return s;
	}
}
