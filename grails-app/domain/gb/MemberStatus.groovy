package gb

import groovy.transform.CompileStatic

@CompileStatic
enum MemberStatus {

    ACTIVE(0),
    PENDING(1),
    SUSPENDED(2),
    CANCELLED(3),
    INVALID(-1),
    final int id
    private MemberStatus(int id) { this.id = id }
}