package gb

class ContactInfo {

    String email
    String phone
    String mobile

    static constraints = {
        email nullable:false, blank:false, size: 2..50
        phone nullable:true, blank:true, size: 2..10
        mobile nullable:true, blank:true, size: 2..10
    }
}
