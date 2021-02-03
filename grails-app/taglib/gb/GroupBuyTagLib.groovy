package gb

import gb.Group
import gb.GroupService

import org.grails.web.servlet.mvc.SynchronizerTokensHolder

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

    def tokenFields = { attrs, body -> 
        def tokensHolder = SynchronizerTokensHolder.store(session)
        out << """
                ${hiddenField(name: SynchronizerTokensHolder.TOKEN_KEY, value: tokensHolder.generateToken(request.forwardURI))}
                ${hiddenField(name: SynchronizerTokensHolder.TOKEN_URI, value: request.forwardURI)}"""
    }

    def synchronizerToken = { attrs, body -> 
        def tokensHolder = SynchronizerTokensHolder.store(session)
        out << "${tokensHolder.generateToken(request.forwardURI)}"
    }

}
