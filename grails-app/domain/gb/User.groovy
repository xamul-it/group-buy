package gb

class User {
	String email
	String name
	Address deliveryAddress 
	
	static embedded = ['deliveryAddress']
	
    static constraints = {
		email email: true, blank: false
    }
}
