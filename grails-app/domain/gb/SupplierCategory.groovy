package gb

class SupplierCategory {


    static hasMany = [group: Supplier]

    String name

    static constraints = {
        name nullable: false, blank: false, size: 5..200, unique: true
    }

}
