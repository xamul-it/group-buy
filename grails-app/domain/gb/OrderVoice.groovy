package gb

class OrderVoice implements Comparable {
	Product product
	Date insertDate = new Date()
	User user
	Integer quantityRequested
	Integer quantityShipped
	String description
	Float estimatedPrice
	Float finalPrice
	Order order

	transient Boolean isOwner

	static belongsTo = [order: Order, user: User]

	static transients = ['isOwner']

	transient springSecurityService

	static embedded = ['product']

    static constraints = {
		product nullable: true
		user nullable: false
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
			user= User.get(springSecurityService.getPrincipal().id)
		}
	}

	Boolean getIsOwner(){
		log.debug("ORDER!!!! isOwner springSecurityService:${springSecurityService} this.user:${this.user} == currentUser:${springSecurityService?.getCurrentUser()}")
		isOwner = this.user == springSecurityService?.getCurrentUser();
		return isOwner
	}

}
