package gb

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class GroupBuyInterceptorSpec extends Specification implements InterceptorUnitTest<GroupBuyInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test groupBuy interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"groupBuy")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
