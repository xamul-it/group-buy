package gb

class Address {
	String city
    String address1
    String address2
    String postalCode
    String countryCode

    static constraints = {
        city nullable:false, blank:false, size: 2..20
        address1 nullable:false, blank:false, size: 2..20
        address2 nullable:true, blank:true, size: 2..20
        postalCode nullable:false, blank:false, size: 5..5
        countryCode nullable:false, blank:false, size: 2..2
    }
}
