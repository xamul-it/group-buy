package gb

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ShopServiceSpec extends Specification {

    ShopService shopService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Shop(...).save(flush: true, failOnError: true)
        //new Shop(...).save(flush: true, failOnError: true)
        //Shop shop = new Shop(...).save(flush: true, failOnError: true)
        //new Shop(...).save(flush: true, failOnError: true)
        //new Shop(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //shop.id
    }

    void "test get"() {
        setupData()

        expect:
        shopService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Shop> shopList = shopService.list(max: 2, offset: 2)

        then:
        shopList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        shopService.count() == 5
    }

    void "test delete"() {
        Long shopId = setupData()

        expect:
        shopService.count() == 5

        when:
        shopService.delete(shopId)
        sessionFactory.currentSession.flush()

        then:
        shopService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Shop shop = new Shop()
        shopService.save(shop)

        then:
        shop.id != null
    }
}
