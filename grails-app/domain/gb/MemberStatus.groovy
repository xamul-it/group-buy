package gb

import groovy.transform.CompileStatic

@CompileStatic
enum MemberStatus {

    ACTIVE(0,"Attivo"),
    PENDING(1,"In attesa"),
    SUSPENDED(2, "Sospeso"),
    CANCELLED(3,"Cancellato"),
    INVALID(-1,"Invalido"),
    final int id
    final String value
    private MemberStatus(int id,String value) { this.id = id; this.value=value }

    public static MemberStatus getById(int id) {
        for(MemberStatus e : values()) {
            if(e.id.equals(id)) return e;
        }
        return MemberStatus.INVALID;
    }

    public String toString(){
        return this.value
    }
}