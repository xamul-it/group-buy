package gb

import groovy.transform.CompileStatic

@CompileStatic
enum MemberStatus {
    PENDING(-1),
    ACTIVE(0),
    SUSPENDED(1),
    REMOVED(2),

    final int id
    private MemberStatus(int id) { this.id = id }
}