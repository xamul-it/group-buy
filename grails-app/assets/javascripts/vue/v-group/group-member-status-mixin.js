export const groupMemberStatusMixin = {
  methods: {
    memberStatus(/*Number*/ id) {
      let status = "Sconosciuto";
      switch (id) {
        case 0:
          status = "Attivo"; //ACTIVE(0)
          break;
        case 1:
          status = "In sospeso"; //PENDING(1)
          break;
        case 2:
          status = "Sospeso"; //SUSPENDED(2)
          break;
        case 3:
          status = "Cancellato"; //CANCELLED(3)
          break;
        case -1:
          status = "Non valido"; //INVALID(-1)
          break;
        default:
      }
      return status;
    },

    memberStatusTextClass(/*Number*/ id) {
      let status = "text-warning";
      switch (id) {
        case 0:
          status = "text-success"; //ACTIVE(0)
          break;
        case 1:
          status = "text-secondary"; //PENDING(1)
          break;
        case 2:
          status = "text-primary"; //SUSPENDED(2)
          break;
        case 3:
          status = "text-info"; //CANCELLED(3)
          break;
        case -1:
          status = "text-dark"; //INVALID(-1)
          break;
        default:
      }
      return status;
    },

    memberStatusBgClass(/*Number*/ id) {
      let status = "text-warning";
      switch (id) {
        case 0:
          status = "bg-success"; //ACTIVE(0)
          break;
        case 1:
          status = "bg-secondary"; //PENDING(1)
          break;
        case 2:
          status = "bg-primary"; //SUSPENDED(2)
          break;
        case 3:
          status = "bg-info"; //CANCELLED(3)
          break;
        case -1:
          status = "bg-dark"; //INVALID(-1)
          break;
        default:
      }
      return status;
    },
  },
};
