package gb

class OrderStatusLog {
    OrderStatus status
    Order order
    Date date
    String note
    User user

    static constraints = {
        status nullable: false
        order nullable: false
        date nullable: false
        user nullable: false
        note nullable: true
    }
}
