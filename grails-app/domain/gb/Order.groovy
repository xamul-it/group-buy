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
	String token
	transient String statusName


	transient springSecurityService

//	transient IUserService userService;

	static belongsTo = [group: Group]
	
	static hasMany = [orderVoice: OrderVoice]
		
    static constraints = {
		supplier nullable: false
		orderVoice nullable: true
		shipmentDate nullable: true
		deliveryType nullable: true
		token nullable:true
		status nullable:true
    }
	
	static mapping = {
        table "gborder"
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
}
