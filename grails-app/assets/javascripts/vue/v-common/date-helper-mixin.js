//require moment@2.29.1/moment.js & /moment@2.29.1/locale/it.js

//Moment.js
moment.locale("it");

export const dateHelperMixin = {
  methods: {
    timeFromNow(date) {
      return moment(date).fromNow();
    },
    dateTime(date) {
      return moment(date).format("D MMMM YYYY, h:mm");
    },
    dateSimple(date) {
      return moment(date).format("D MMMM YYYY");
    },
  },
};
