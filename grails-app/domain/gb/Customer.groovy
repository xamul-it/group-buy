package gb

class Customer {//extends User {

    Address deliveryAddress
    User user
		
	static mapping = {
        user nullable:true
    }

    static embedded = ['deliveryAddress']
}
