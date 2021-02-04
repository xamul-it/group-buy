package gb

class DeliveryInfo {

    String bookTimes
    String deliveryTimes
    String deliveryInfo
    String paymentInfo
    String deliveryFee

    static constraints = {
        bookTimes nullable:true, blank:true, size: 1..500
        deliveryTimes nullable:true, blank:true, size: 1..500
        deliveryInfo nullable:true, blank:true, size: 1..500
        paymentInfo nullable:true, blank:true, size: 1..500
        deliveryFee nullable:true, blank:true, size: 1..500
    }
}
