package gb

class Customer extends User {
		
		
	static mapping = {
        discriminator value: "customer"
    }
}
