//https://stackoverflow.com/a/40388120

var VueTitle = Vue.component("VueTitle", {
  name: "vue-title",
  props: {
    title: {
      type: String,
      required: true,
      default: "Page title",
    },
    prefix: {
      type: String,
      required: false,
      default: null,
    },
  },
  watch: {
    title: {
      immediate: true,
      handler() {
        if (this.prefix) {
          document.title = this.prefix + " - " + this.title;
        } else {
          document.title = this.title;
        }
      },
    },
  },
  render() {},
});

export default VueTitle;
