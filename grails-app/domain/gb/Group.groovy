package gb

class Group {
	String name
	String description
	Address deliveryAddress
	Date creationDate
	List members = new ArrayList()
	boolean publicGroup
	
	static belongsTo = [owner: User]
	
	static hasMany = [members: GroupMember]

	static hasOne = [category: GroupCategory]

	String facebook
	String twitter
	String youtube
	String linkedin
	String instagram
	String whatsapp
	String skype
	String slack
	String snapchat

	Boolean member; //transient - true if logged user is group member

	Boolean administrator; //transient - true if logged user is group owner

	@Autowired
	transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

	static transients = ['member', 'administrator']
	static constraints = {
		name nullable: false, blank: false, size: 5..20, unique: true

		facebook url: true, nullable: true
		twitter url: true, nullable: true
		youtube url: true, nullable: true
		linkedin url: true, nullable: true
		instagram url: true, nullable: true
		whatsapp url: true, nullable: true
		skype url: true, nullable: true
		slack url: true, nullable: true
		snapchat url: true, nullable: true



//		name nullable: false, blank: false, size: 5..20, unique: true,
//				validator: { val, obj ->
//					obj.springSecurityService && (obj.owner.id == obj.springSecurityService.getPrincipal().id ||
//							(obj.owner != null && obj.owner.id == obj.springSecurityService.getPrincipal().id)
//					)
//				}
		description size: 5..200, blank: true
    }



	static mapping = {
		autowire true //if missed, by default autowired in domain classes is disabled due to performance issues.
					  // Here needed in isMember() and isAdministrator() methods
        table "gbgroup"
		owner fetch: 'join'
	}
	static embedded = ['deliveryAddress']

	Boolean getMember(){
		return this.members.contains(this.springSecurityService.getCurrentUser());
	}

	boolean getAdministrator(){
		return this.owner == this.springSecurityService.getCurrentUser();
	}

	def beforeValidate () {
		if (id==null) {
			if (springSecurityService && springSecurityService.isLoggedIn()) {
				if(owner == null){
					owner = springSecurityService.getCurrentUser()
				}
			}
			creationDate = new Date()
			members = new ArrayList()
			members.add(owner)
		}
		if (deliveryAddress!=null) deliveryAddress.countryCode="IT"
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
