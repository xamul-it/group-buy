package gb

class GroupMember {

    static belongsTo = [user:User]
    static hasOne = [group:Group]
    Date subscriptionDate
    Date lastUpdate
    MemberStatus status
    transient String statusName


    static constraints = {
        subscriptionDate nullable: false
        lastUpdate nullable: false
        status nullable: false, enumType: 'string'
    }

    static mapping = {
        autowire true //if missed, by default autowired in domain classes is disabled due to performance issues.
        // Here needed in isMember() and isAdministrator() methods
        user fetch: 'join'
    }
    def beforeInsert = {
        subscriptionDate = new Date();
        lastUpdate = new Date();
    }
    def beforeUpdate = {
        lastUpdate = new Date();
    }

    public String getStatusName(){
        return (status ? status.name : "N/A");
    }

}
