package gb

class GroupCategory {

    static hasMany = [group: Group]

    String name

    static constraints = {
        name nullable: false, blank: false, size: 5..20, unique: true
    }

}
