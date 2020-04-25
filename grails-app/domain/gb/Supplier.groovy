package gb

class Supplier {

    Address shippingAddress
    ContactInfo contactInfo
    User user
    //String email
    String name
    String description

    static constraints = {
        user nullable:true
    }

    static mapping = {
        address nullable:true
        user nullable:true
        discriminator value: "supplier"
        name nullable: false, blank: false, size: 5..20
        description nullable: false, blank: false, size: 5..200
        //email nullable: true, blank: true, size: 5..20
    }
    static embedded = ['shippingAddress','contactInfo']

}
