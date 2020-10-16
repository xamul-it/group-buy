//require vue@2.6.11 vuex@3.5.1 vuex-map-fields@1.4.0

import {
  getField,
  updateField,
} from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";

import * as orderActions from "/assets/vue/v-store/order-actions.js";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    id: "Order-store",
    pagination: {
      total: 0,
      max: 4, //The maximum number to list
      offset: 0, //The offset from the first result to list from
    },
    sort: {
      sort: "", //The property name to sort by
      order: "", //How to order the list, either "desc" or "asc"
    },
    search: {
      searchQuery: "",
      search: false,
      searchDirty: false,
      reset: false,
    },
    order: {
      orderList: [],
      orderItem: null,
      orderVoices: [],
    },
    success: null,
    error: null,
    loading: false,
    debug: false,
    geolocationSupported: "geolocation" in navigator,
  },
  getters: {
    getField,
  },
  mutations: {
    updateField,
    /*updateGroupInList(state, payload) {
      state.group.groupList = _.map(state.group.groupList, (g) => {
        if (g.id == payload.group.id) return payload.group;
        else return g;
      });
    },*/
  },
  actions: {
    ...orderActions,
  },
});
