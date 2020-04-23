package gb

class BootStrap {

    def init = { servletContext ->
/*
        def adminRole = new gb.Role(authority: 'ROLE_ADMIN').save()

        def testUser = new gb.User(username: 'me', password: 'password').save()

        gb.UserRole.create testUser, adminRole

        gb.UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert gb.User.count() == 2
        assert gb.Role.count() == 4
        assert gb.UserRole.count() == 2
*/
    }

    def destroy = {
    }
}
