//require vue@2.6.11 vuex@3.5.1 vuex-map-fields@1.4.0

import {
  getField,
  updateField,
} from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";

import * as supplierActions from "/assets/vue/v-store/supplier-actions.js";
import * as commonActions from "/assets/vue/v-store/actions/common-actions.js";
import * as searchActions from "/assets/vue/v-store/actions/search-actions.js";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    id: "Supplier-store",
    pagination: {
      total: 0,
      max: 12, //The maximum number to list
      offset: 0, //The offset from the first result to list from
    },
    sort: {
      sort: "", //The property name to sort by
      order: "", //How to order the list, either "desc" or "asc"
    },
    search: {
      searchQuery: "",
      searchAddress: {},
      searchAddressString: "",
      searchCategoryId: 0,
      searchLatitude: 0.0,
      searchLongitude: 0.0,
      search: false,
      searchDirty: false,
      reset: false,
    },
    supplier: {
      supplierCategories: [],
      supplierList: [],
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
    ...supplierActions,
    ...commonActions,
    ...searchActions,
  },
});
