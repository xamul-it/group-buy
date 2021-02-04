//require vue-toasted@1.1.28

export const alertHelperMixin = {
  methods: {
    fetchError(error) {
      let errorData = null;
      if (error.response) {
        errorData = error.response.data;
      }
      let errorMessage = "";
      if (errorData) {
        console.log("errorData", errorData);
        if (errorData.errors) {
          errorMessage = _.reduce(
            errorData.errors,
            function (message, e) {
              if (message != "") return message + "<br/>\n" + e.message;
              else return e.message;
            },
            ""
          );
        }
      } else {
        errorMessage = error;
      }
      return errorMessage;
    },
  },
};
