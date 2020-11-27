package gb

class DeliveryInfo {

    String bookTimes
    String deliveryTimes
    String deliveryInfo
    String paymentInfo
    String deliveryFee

    static constraints = {
        bookTimes nullable:true, blank:true, size: 1..255
        deliveryTimes nullable:true, blank:true, size: 1..255
        deliveryInfo nullable:true, blank:true, size: 1..255
        paymentInfo nullable:true, blank:true, size: 1..255
        deliveryFee nullable:true, blank:true, size: 1..255
    }
}
