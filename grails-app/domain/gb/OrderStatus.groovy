package gb
import groovy.transform.CompileStatic

@CompileStatic
enum OrderStatus {
    INVALID(-1,"Invalido"),
    ACTIVE(0,"Attivo"),
    SENT(1,"Inviato"),
    ACCEPTED(2, "Accettato"),
    REJECTED(3,"Rifiutato"),
    SHIPPED(4,"In consegna"),
    DELIVERED(5,"Consegnato"),

    final int id
    final String value
    private OrderStatus(int id,String value) { this.id = id; this.value=value }

    public static OrderStatus getById(int id) {
        for(OrderStatus e : values()) {
            if(e.id.equals(id)) return e;
        }
        return OrderStatus.INVALID;
    }



    public String toString(){
        return this.value
    }
}
