package gb

class Customer extends User {

    Address deliveryAddress
		
	static mapping = {
        discriminator value: "customer"
    }

    static embedded = ['deliveryAddress']
}
