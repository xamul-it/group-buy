//require vue@2.6.11 vue-toasted@1.1.28

const POSITION = "bottom-center";
const DURATION = 8000;
const THEME = "bubble";
const ICONPACK = "fontawesome";
    
Vue.use(Toasted);

export function alertDanger(message) {
    Vue.toasted.error(message, {
      position: POSITION,
      duration: DURATION,
      iconPack: ICONPACK,
      theme: THEME,
      type: "error",
      icon: "exclamation-triangle",
      className: ["alert", "alert-danger"],
      action: {
        //text : 'X',
        icon: "times",
        onClick: (e, toastObject) => {
          toastObject.goAway(0);
        },
      },
    });
}

export function alertSuccess(message) {
  Vue.toasted.success(message, {
    position: POSITION,
    duration: DURATION,
    iconPack: ICONPACK,
    theme: THEME,
    type: "success",
    icon: "info-circle",
    className: ["alert", "alert-success"],
    action: {
      //text : 'X',
      icon: "times",
      onClick: (e, toastObject) => {
        toastObject.goAway(0);
      },
    },
  });
}