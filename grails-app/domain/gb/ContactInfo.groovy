package gb

class ContactInfo {

    String email
    String phone1
    String phone2
    String web


    static constraints = {
        email nullable:false, blank:false, size: 2..50 //, email: true
        phone1 nullable:true, blank:true, size: 2..50
        phone2 nullable:true, blank:true, size: 2..50
        web nullable:true, blank:true, size: 1..255
    }
}
