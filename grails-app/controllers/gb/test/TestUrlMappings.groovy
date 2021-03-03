package gb.ui

import grails.util.Environment

class TestUrlMappings {

    static mappings = {

        if (Environment.current == Environment.DEVELOPMENT ||
            Environment.current == Environment.TEST) {

            group "/test", {
                "/emailTest/$action?/$id?/"(controller:"emailTest")
            }

        }

    }
}