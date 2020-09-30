package gb

import gb.Group
import gb.GroupService

class GroupBuyTagLib {
    static namespace = 'gb' 
    static defaultEncodeAs = [taglib:'text']

    @Autowired
	GroupService groupService

    def ifGroupOwner = { attrs, body -> 
        if( groupService.isOwner(attrs.groupId?.toLong()?:0) ) {
            out << body()
        }
    }

}
