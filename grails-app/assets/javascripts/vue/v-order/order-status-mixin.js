function orderStatusClassSuffix(/*Number*/ id) {
  let classSuffix = "warning";
  switch (id) {
    case 0:
      classSuffix = "blue"; //ACTIVE(0,"Attivo")
      break;
    case 1:
      classSuffix = "primary"; //SENT(1,"Inviato")
      break;
    case 2:
      classSuffix = "success"; //ACCEPTED(2, "Accettato")
      break;
    case 3:
      classSuffix = "danger"; //REJECTED(3,"Rifiutato")
      break;
    case 4:
      classSuffix = "cyan"; //SHIPPED(4,"In consegna")
      break;
    case 5:
      classSuffix = "gray"; //DELIVERED(5,"Consegnato")
      break;
    case -1:
      classSuffix = "pink"; //INVALID(-1,"Invalido"),
      break;
    default:
  }
  return classSuffix;
}

export const orderStatusMixin = {
  methods: {
    orderStatus(/*Number*/ id) {
      let status = "Sconosciuto";
      switch (id) {
        case 0:
          status = "Attivo"; //ACTIVE(0,"Attivo")
          break;
        case 1:
          status = "Inviato"; //SENT(1,"Inviato")
          break;
        case 2:
          status = "Accettato"; //ACCEPTED(2, "Accettato")
          break;
        case 3:
          status = "Rifiutato"; //REJECTED(3,"Rifiutato")
          break;
        case 4:
          status = "In consegna"; //SHIPPED(4,"In consegna")
          break;
        case 5:
          status = "Consegnato"; //DELIVERED(5,"Consegnato")
          break;
        case -1:
          status = "Non valido"; //INVALID(-1,"Invalido"),
          break;
        default:
      }
      return status;
    },

    orderStatusTextClass(/*Number*/ id) {
      let textClass = "text-warning";
      switch (id) {
        case 0:
          textClass = "text-blue"; //ACTIVE(0,"Attivo")
          break;
        case 1:
          textClass = "text-primary"; //SENT(1,"Inviato")
          break;
        case 2:
          textClass = "text-success"; //ACCEPTED(2, "Accettato")
          break;
        case 3:
          textClass = "text-danger"; //REJECTED(3,"Rifiutato")
          break;
        case 4:
          textClass = "text-cyan"; //SHIPPED(4,"In consegna")
          break;
        case 5:
          textClass = "text-gray"; //DELIVERED(5,"Consegnato")
          break;
        case -1:
          textClass = "text-pink"; //INVALID(-1,"Invalido"),
          break;
        default:
      }
      return textClass;
    },

    orderStatusBgClass(id) {
      return "bg-" + orderStatusClassSuffix(id);
    },

    orderStatusBadgeClass(id) {
      return "badge-" + orderStatusClassSuffix(id);
    },

    orderStatusBtnClass(id) {
      return "btn-" + orderStatusClassSuffix(id);
    },

    orderStatusBtnOutlineClass(id) {
      return "btn-outline-" + orderStatusClassSuffix(id);
    },

    canEdit(id) {
      return id == 0;
    },
  },
};
