package gb

class Shop {
    String frienlyName
    String urlName
    String shortDescription
    String description
    Boolean delivery = true
    Float minDeliveryAmount = 0
    Long maxDeliveryDistance = 0
    Boolean onlyCash = false
    Boolean portablePOS = false
    Boolean internetPayments = true

    static belongsTo = [user: User]

    static constraints = {
         frienlyName: false
         urlName: false
         shortDescription: false
         description: false

    }
}
