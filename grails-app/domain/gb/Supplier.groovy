package gb

/**
 * Creazione:
 * Il creator deve essere impostato al utente corrente loggato
 *
 * Consultazione:
 * I dati "contactInfo" e "shippingAddress" possono essere recuperati solo dal creatore o dal owner
 *
 * Modifica
 * La modifica è consentita solo dal creatore o dal owner
 */

class Supplier {

    Address shippingAddress
    ContactInfo contactInfo
    DeliveryInfo deliveryInfo
    User creator
    User owner
    String name
    String description

    static hasOne = [category: SupplierCategory]

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    static constraints = {
        creator nullable:false
        shippingAddress nullable:true
        owner nullable:true
        name nullable: false, blank: false, size: 5..200, unique: false/*,
                validator: { val, obj ->
                    obj.springSecurityService && (obj.creator.id == obj.springSecurityService.getPrincipal().id ||
                            (obj.owner != null && obj.owner.id == obj.springSecurityService.getPrincipal().id)
                    )
                }*/
        description nullable: false, blank: false, size: 5..2000
    }

    static mapping = {
        discriminator value: "supplier"
    }
    static embedded = ['shippingAddress','contactInfo','deliveryInfo']

    def beforeValidate () {
        if (id==null) {
            if (springSecurityService && springSecurityService.isLoggedIn()) {
                creator= User.get(springSecurityService.getPrincipal().id)
            }
        }
        if (shippingAddress!=null) shippingAddress.countryCode="IT"
    }
}
