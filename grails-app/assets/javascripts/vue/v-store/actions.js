export const setLoadingState = ({ commit }) => {
  commit("updateField", { path: "error", value: null });
  commit("updateField", { path: "loading", value: true });
};

export const resetLoadingState = ({ commit }) => {
  commit("updateField", { path: "loading", value: false });
};

export const setErrorState = ({ commit }, error) => {
  commit("updateField", { path: "error", value: error });
  commit("updateField", { path: "loading", value: false });
};

export const fetchCategoriesAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  console.log("fetchCategoriesAction");
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.list(100, 0, "name", "asc");
    //commit("setCategories", data);
    commit("updateField", { path: "group.groupCategories", value: data });
    // https://github.com/maoberlehner/vuex-map-fields/issues/114
    // Reset the loading state after fetching
    dispatch("resetLoadingState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchCategoriesAction state", state);
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
    dispatch("resetLoadingState");
    if (state.debug)
      console.log(
        "Address",
        _.toString(_.valuesIn(state.search.searchAddress)),
        state.search.searchAddress
      );
  } catch (error) {
    if (state.debug) console.log("error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchAddressAction state", state);
  }
};

export const fetchCoordinatesAction = async (
  { commit, dispatch, state },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let coords = await payload.service.coordinatesByAddress(
      payload.addressString
    );
    commit("updateField", {
      path: "search.searchLatitude",
      value: coords.latitude,
    });
    commit("updateField", {
      path: "search.searchLongitude",
      value: coords.longitude,
    });
    // Reset the loading state after fetching
    dispatch("resetLoadingState");
    if (state.debug) console.log("coordinates", coords);
  } catch (error) {
    if (state.debug) console.log("error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchCoordinatesAction state", state);
  }
};

export const fetchGroupListAction = async (
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
    });
    if (payload.reload) {
      commit("updateField", {
        path: "group.groupList",
        value: data,
      });
    } else {
      //this.groups = _.concat(this.groups, data);
      commit("updateField", {
        path: "group.groupList",
        value: _.concat(getters.getField("group.groupList"), data),
      });
    }
    commit("updateField", {
      path: "pagination.total",
      value: headers["x-pagination-total"],
    });
    // Reset the loading state after fetching
    dispatch("resetLoadingState");
  } catch (error) {
    console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupListAction state", state);
  }
};

export const subscription = async (
  { commit, dispatch, state, getters },
  payload
) => {
  console.log("subscription", payload);
  try {
    dispatch("setLoadingState");
    let r;

    if (payload.subscribe) r = await payload.service.subscribe(payload.groupId);
    else r = await payload.service.unsubscribe(payload.groupId);

    commit("success", r.status + " OK");
    commit("updateGroupInList", { group: r.data });
    // Reset the loading state after fetching
    dispatch("resetLoadingState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("subscription state", state);
  }
};
