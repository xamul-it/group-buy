package gb.rest.v1

import grails.rest.RestfulController

import gb.GroupMember
import gb.GroupMemberService

class GroupMemberController extends RestfulController<GroupMember> {

    static namespace = 'v1'
    static responseFormats = ['json']

    GroupMemberService groupMemberService
    transient springSecurityService

    GroupMemberController() {
        super(GroupMember)
    }

    /**
     * List all of resource based on parameters
     *
     * @return List of resources or empty if it doesn't exist
     */
    @Override
    protected List<GroupMember> listAllResources(Map params) {
        log.debug "members listAllResources" + params
        response.setHeader('X-Pagination-Total', groupMemberService.count(params).toString())
        groupMemberService.list(params)
    }

}