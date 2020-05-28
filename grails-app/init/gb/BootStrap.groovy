package gb

import grails.converters.JSON

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

        //custom marshaller to get group transient fields in gsp pages
        JSON.registerObjectMarshaller(Group) {
            def returnArray = [:]
            returnArray['id'] = it.id
            returnArray['name'] = it.name
            returnArray['description'] = it.description
            returnArray['deliveryAddress'] = it.deliveryAddress
            returnArray['creationDate'] = it.creationDate
            returnArray['members'] = it.members
            returnArray['publicGroup'] = it.publicGroup
            returnArray['owner'] = it.owner
            returnArray['member'] = it.member
            returnArray['administrator'] = it.administrator
            return returnArray
        }
    }

    def destroy = {
    }
}
