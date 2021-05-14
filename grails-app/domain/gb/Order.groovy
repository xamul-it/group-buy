package gb
import java.util.UUID

class Order {
	SortedSet orderVoice
	Supplier supplier
	Date orderDate
	Date shipmentDate
	String deliveryType
	String description
	OrderStatus status
	User user
	String token
	transient String statusName

	transient springSecurityService

	static belongsTo = [group: Group]
	
	static hasMany = [orderVoice: OrderVoice]
		
    static constraints = {
		supplier nullable: false
		orderVoice nullable: true
		shipmentDate nullable: true
		deliveryType nullable: true
		token nullable:true
		status nullable:true
		user nullable:false
    }
	
	static mapping = {
        table "gborder"
        autowire true //if missed, by default autowired in domain classes is disabled due to performance issues.
    }

	public String getStatusName(){
		return (status ? status.name : "N/A");
	}

	def beforeInsert() {
		if (token == null) {
			token = UUID.randomUUID().toString();
		}
		if (status == null) {
			status = OrderStatus.ACTIVE
		}

	}

	def afterInsert(){
	}

	def beforeValidate () {
		if (id==null) {
			user= User.get(springSecurityService.getPrincipal().id)
		}
	}

}
