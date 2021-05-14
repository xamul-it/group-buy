package gb

import grails.plugin.springsecurity.SpringSecurityService

class OrderVoice implements Comparable {

	SpringSecurityService springSecurityService

	Product product
	Date insertDate = new Date()
	User user
	Integer quantityRequested
	Integer quantityShipped
	String description
	Float estimatedPrice
	Float finalPrice
	Order order

	Boolean isOwner

	static mapping = {
       autowire true //if missed, by default autowired in domain classes is disabled due to performance issues.
   	}
	
	static transients = ['springSecurityService','isOwner']

	static belongsTo = [order: Order, user: User]

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
