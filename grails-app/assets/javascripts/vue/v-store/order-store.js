//require vue@2.6.11 vuex@3.5.1 vuex-map-fields@1.4.0

import {
  getField,
  updateField,
} from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";

import * as orderActions from "/assets/vue/v-store/order-actions.js";
import * as sharedActions from "/assets/vue/v-store/actions/shared-actions.js";
import * as userActions from "/assets/vue/v-store/actions/user-actions.js";
import * as groupActions from "/assets/vue/v-store/group-actions.js";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    id: "Order-store",
    pagination: {
      total: 0,
      max: 10, //The maximum number to list
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
      suppliers: [],
    },
    user: {
      userItem: null,
      userId: 0,
    },
    group: {
      groupItem: null,
      groupList: [],
    },
    supplier: {
      supplierItem: null,
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
  },
  actions: {
    ...orderActions,
    ...sharedActions,
    ...userActions,
    ...groupActions,
  },
});
