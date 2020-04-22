package gb

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SupplierServiceSpec extends Specification {

    SupplierService supplierService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Supplier(...).save(flush: true, failOnError: true)
        //new Supplier(...).save(flush: true, failOnError: true)
        //Supplier supplier = new Supplier(...).save(flush: true, failOnError: true)
        //new Supplier(...).save(flush: true, failOnError: true)
        //new Supplier(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //supplier.id
    }

    void "test get"() {
        setupData()

        expect:
        supplierService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Supplier> supplierList = supplierService.list(max: 2, offset: 2)

        then:
        supplierList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        supplierService.count() == 5
    }

    void "test delete"() {
        Long supplierId = setupData()

        expect:
        supplierService.count() == 5

        when:
        supplierService.delete(supplierId)
        sessionFactory.currentSession.flush()

        then:
        supplierService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Supplier supplier = new Supplier()
        supplierService.save(supplier)

        then:
        supplier.id != null
    }
}
