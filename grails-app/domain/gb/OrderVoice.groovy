package gb

class OrderVoice implements Comparable {
	Product product
	Date insertDate =new Date()
	User user
	Integer quantityRequested
	Integer quantityShipped
	String description
	Float estimatedPrice
	Float finalPrice

	transient Boolean isOwner

	static transients = ['isOwner']


	@Autowired
	transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

	static embedded = ['product']

    static constraints = {
		product nullable: true
		user nullable: true
		quantityRequested nullable: true
		quantityShipped nullable: true
		description nullable: true
		estimatedPrice nullable: true
		finalPrice nullable: true
    }

	int compareTo(obj) {
		(id ? id.compareTo(obj.id) : 0)
	}

	def beforeValidate () {
		if (id==null) {
			println("Spring OV "+springSecurityService)
			if (springSecurityService && springSecurityService.isLoggedIn()) {
				user= User.get(springSecurityService.getPrincipal().id)
			}
		}
	}

	boolean getIsOwner(){
		return this.user == springSecurityService?.getCurrentUser();
	}

}
