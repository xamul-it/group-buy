package gb

import grails.gorm.services.Service

interface IProductService {

    Product get(Serializable id)

    List<Product> list(Map args)

    Long count()

    void delete(Serializable id)

    Product save(Product product)
}

@Service(Product)
abstract class ProductService implements IProductService {

    SupplierService supplierService

    void saveProductList(List<Product> products) {

        Supplier supplier = supplierService.get()

        println supplier;

        Product.findAllBySupplier(supplier).each { it.delete(flush:false, failOnError:false) }

        products.eachWithIndex{ product, index ->
            product.supplier = supplier
            product.code = 'n/a'
            product.save(flush: false, failOnError: false, validate:false,deepValidate:false);

            // http://krixisolutions.com/bulk-insert-grails-gorm/
            /*if(index.mod(100)==0) {
                cleanUpGorm()
            }*/
        }

    }

    def cleanUpGorm() {
        def session = sessionFactory.currentSession
        session.flush()
        session.clear()
        propertyInstanceMap.get().clear()
    }

}