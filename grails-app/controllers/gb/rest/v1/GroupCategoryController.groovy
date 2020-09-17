package gb.rest.v1

import grails.rest.RestfulController

import gb.GroupCategory

class GroupCategoryController extends RestfulController<GroupCategory> {

    static namespace = 'v1'
    static responseFormats = ['json']
    static boolean readOnly = true

    GroupCategoryController() {
        super(GroupCategory, readOnly)
    }

}