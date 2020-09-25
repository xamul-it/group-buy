package gb

import gb.Group
import gb.GroupService

class GroupBuyTagLib {
    static namespace = 'gb' 
    static defaultEncodeAs = [taglib:'text']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    @Autowired
	GroupService groupService

    def ifGroupOwner = { attrs, body -> 
        log.debug "ifGroupOwner $attrs"
        if( groupService.isOwner(attrs.groupId.toLong()) ) {
            out << body()
        }
    }

}
