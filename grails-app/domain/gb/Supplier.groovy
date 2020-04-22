package gb

class Supplier extends User{

    static constraints = {
    }
	
	static mapping = {
        discriminator value: "supplier"
    }

}
