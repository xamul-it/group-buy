
package gb

class Member {

    User user
    Group group
    Date subscriptionDate
    Date lastUpdate
    MemberStatus status

    static constraints = {
        subscriptionDate nullable: false
        lastUpdate nullable: false
        status nullable: false, enumType: 'string'
    }

    static mapping = {
        autowire true //if missed, by default autowired in domain classes is disabled due to performance issues.
        // Here needed in isMember() and isAdministrator() methods
        table "gbgroup_user"
        owner fetch: 'join'
    }
}
