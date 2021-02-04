<<<<<<< HEAD
//require vue@2.6.11 vuex@3.5.1 vuex-map-fields@1.4.0

import {
  getField,
  updateField,
} from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";

import * as userActions from "/assets/vue/v-store/user-actions.js";
import * as commonActions from "/assets/vue/v-store/actions/common-actions.js";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    id: "User-store",
    pagination: {
      total: 0,
      max: 12, //The maximum number to list
      offset: 0, //The offset from the first result to list from
    },
    sort: {
      sort: "", //The property name to sort by
      order: "", //How to order the list, either "desc" or "asc"
    },
    user: {
      userItem: null,
    },
    success: null,
    error: null,
    loading: false,
    debug: false,
  },
  getters: {
    getField,
  },
  mutations: {
    updateField,
  },
  actions: {
    ...userActions,
    ...commonActions,
  },
});
=======
//require vue@2.6.11 vuex@3.5.1 vuex-map-fields@1.4.0

import {
  getField,
  updateField,
} from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";

import * as userActions from "/assets/vue/v-store/actions/user-actions.js";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    id: "User-store",
    pagination: {
      total: 0,
      max: 12, //The maximum number to list
      offset: 0, //The offset from the first result to list from
    },
    sort: {
      sort: "", //The property name to sort by
      order: "", //How to order the list, either "desc" or "asc"
    },
    user: {
      userItem: null,
    },
    success: null,
    error: null,
    loading: false,
    debug: false,
  },
  getters: {
    getField,
  },
  mutations: {
    updateField,
  },
  actions: {
    ...userActions,
  },
});
>>>>>>> b93c39cf32d719a77b044e90c88e7373debc3e16
