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
	long activeOrders
	long activeSubscribers
	long orders

	transient Boolean member; //transient - true if logged user is group member
	transient Long memberCount; //transient
	transient Boolean administrator; //transient - true if logged user is group owner

	transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

	transient Boolean isMember
	transient MemberStatus memberStatus


	static transients = ['member','isMember', 'administrator', 'memberStatus', 'memberCount']

	static constraints = {
		name nullable: false, blank: false, size: 5..255, unique: true
		activeOrders defaultValue:0
		activeSubscribers defaultValue:0
		orders defaultValue:0
		facebook size: 5..255, nullable: true
		twitter size: 5..255, nullable: true
		youtube size: 5..255, nullable: true
		linkedin size: 5..255, nullable: true
		instagram size: 5..255, nullable: true
		whatsapp size: 5..255, nullable: true
		skype size: 5..255, nullable: true
		slack size: 5..255, nullable: true
		snapchat size: 5..255, nullable: true



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

	MemberStatus getMemberStatus() {
		if (isMember==null){
			loadMemberStatus()
		}
		return memberStatus
	}

	/**
	 * @deprecated use isMember instead
	 * @return
	 */
	Boolean getMember(){
		return getIsMember()
	}

	Long getMemberCount() {
		//return GroupMember.countByGroup(this)
		return GroupMember.createCriteria().get {
            eq('group',this)
            eq('status', MemberStatus.ACTIVE)
			projections {
				rowCount()
    		}
        }
	}

	private loadMemberStatus(){
		isMember = false
		memberStatus = null
		if (this.springSecurityService!=null && this.springSecurityService.getCurrentUser()!=null) {
			String q = "from GroupMember gm " +
					"where gm.user.id = :user and gm.group.id= :group"
			def qparam = [:]
			qparam.user = this.springSecurityService.getCurrentUser().id
			qparam.group = id
			GroupMember gm = GroupMember.find(q, qparam)
			//this.members.contains(this.springSecurityService.getCurrentUser());
			if (gm != null) {
				isMember = (gm.status.equals(MemberStatus.ACTIVE))
				memberStatus = gm.status
			}
		}
	}

	Boolean getIsMember(){
		if (isMember==null){
			loadMemberStatus()
		}
		return isMember
	}

	boolean getAdministrator(){
		return this.owner == this.springSecurityService.getCurrentUser();
	}

	def beforeUpdate(){
		def r = Order.executeQuery("select count(s) from Order as s where s.group.id=  :groupId ", [groupId:id]);
		orders = r[0]
		r  = Order.executeQuery("select count(s) from Order as s where s.group.id=  :groupId " +
				"and s.status = :status" , [groupId:id,status:OrderStatus.ACTIVE]);
		activeOrders = r[0]
		r = GroupMember.executeQuery("select count(s) from GroupMember as s where s.group.id=  :groupId " +
				"and s.status = :status" , [groupId:id,status:MemberStatus.ACTIVE])
		activeSubscribers = r[0]



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
