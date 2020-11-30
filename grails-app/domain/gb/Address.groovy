package gb

class Address {
	String city
    String address1
    String address2
    String postalCode
    String district
    String countryCode
    Double lat
    Double lon

    static constraints = {
        city nullable:false, blank:false, size: 2..200
        address1 nullable:false, blank:false, size: 2..200
        address2 nullable:true, blank:true, size: 2..200
        postalCode nullable:false, blank:false, size: 5..5
        district nullable:false, blank:false, size: 2..2
        countryCode nullable:false, blank:false, size: 2..2
        lat nullable: false, blank: false
        lon nullable: false, blank: false
    }
}
