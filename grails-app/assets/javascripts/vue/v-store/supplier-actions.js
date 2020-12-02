import * as locationActionHeplers from "/assets/vue/v-store/actions/location-actions.js";

export const fetchSupplierCategoriesAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.list(100, 0, "name", "asc");

    if (payload.reload) {
      commit("updateField", {
        path: "supplier.supplierCategories",
        value: data,
      });
    } else {
      commit("updateField", {
        path: "supplier.supplierCategories",
        value: _.concat(getters.getField("supplier.supplierCategories"), data),
      });
    }
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchSupplierCategoriesAction state", state);
  }
};

export const fetchAddressAction = async (
  { commit, dispatch, state },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let {
      currentCoordinates,
      currentAddress,
    } = await payload.service.currentAddress();

    currentAddress.latitude = currentCoordinates.latitude;
    currentAddress.longitude = currentCoordinates.longitude;

    commit("updateField", {
      path: "search.searchAddress",
      value: currentAddress,
    });
    commit("updateField", {
      path: "search.searchLatitude",
      value: currentCoordinates.latitude,
    });
    commit("updateField", {
      path: "search.searchLongitude",
      value: currentCoordinates.longitude,
    });

    // Reset the loading state after fetching
    dispatch("setLoadedState");
    if (state.debug)
      console.log(
        "Address",
        _.toString(_.valuesIn(state.search.searchAddress)),
        state.search.searchAddress
      );
  } catch (error) {
    if (state.debug) console.log("error", error);
    dispatch("setErrorState", error.message);
    throw error;
  } finally {
    if (state.debug) console.log("fetchAddressAction state", state);
  }
};

const fetchCoordinatesHelper = async (payload) => {
  let coords = {};
  if (!_.isUndefined(payload.addressString) && payload.addressString != "") {
    coords = await payload.service.coordinatesByAddress(payload.addressString);
  } else {
    coords = await payload.service.currentCoordinates();
  }
  if (!_.isNumber(coords.latitude)) {
    coords.latitude = _.toNumber(coords.latitude);
    coords.longitude = _.toNumber(coords.longitude);
  }
  return coords;
};

export const fetchCoordinatesAction = async (
  { commit, dispatch, state },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let coords = await fetchCoordinatesHelper(payload);

    commit("updateField", {
      path: "search.searchLatitude",
      value: coords.latitude,
    });
    commit("updateField", {
      path: "search.searchLongitude",
      value: coords.longitude,
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
    if (state.debug) console.log("coordinates", coords);
  } catch (error) {
    if (state.debug) console.log("error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchCoordinatesAction state", state);
  }
};

export const fetchGroupCoordinatesAction = async (
  { commit, dispatch, state },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let coords = await fetchCoordinatesHelper(payload);

    commit("updateField", {
      path: "group.groupItem.deliveryAddress.lat",
      value: coords.latitude,
    });
    commit("updateField", {
      path: "group.groupItem.deliveryAddress.lon",
      value: coords.longitude,
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
    if (state.debug) console.log("coordinates", coords);
  } catch (error) {
    if (state.debug) console.log("error", error);
    dispatch("setErrorState", error.message);
    throw error;
  } finally {
    if (state.debug) console.log("fetchGroupCoordinatesAction state", state);
  }
};

export const fetchSupplierListAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.list({
      max: getters.getField("pagination.max"),
      offset: getters.getField("pagination.offset"),
      sort: getters.getField("sort.sort"),
      order: getters.getField("sort.order"),
      q: getters.getField("search.searchQuery"),
      latitude: getters.getField("search.searchLatitude"),
      longitude: getters.getField("search.searchLongitude"),
      categoryId: getters.getField("search.searchCategoryId"),
    });
    if (payload.reload) {
      commit("updateField", {
        path: "supplier.supplierList",
        value: data,
      });
    } else {
      commit("updateField", {
        path: "supplier.supplierList",
        value: _.concat(getters.getField("supplier.supplierList"), data),
      });
    }
    commit("updateField", {
      path: "pagination.total",
      value: headers["x-pagination-total"],
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchSupplierListAction state", state);
  }
};

export const fetchSupplierAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.show(payload.supplierId);
    commit("updateField", {
      path: "supplier.supplierItem",
      value: data,
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchSupplierAction state", state);
  }
};
