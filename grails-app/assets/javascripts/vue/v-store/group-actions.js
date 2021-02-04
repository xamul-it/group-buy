<<<<<<< HEAD
export const setLoadingState = ({ commit }) => {
  commit("updateField", { path: "success", value: null });
  commit("updateField", { path: "error", value: null });
  commit("updateField", { path: "loading", value: true });
};

export const setLoadedState = ({ commit }, payload) => {
  commit("updateField", { path: "loading", value: false });
};

export const setErrorState = ({ commit }, error) => {
  commit("updateField", { path: "error", value: error });
  commit("updateField", { path: "loading", value: false });
};

export const fetchGroupCategoriesAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.list(100, 0, "name", "asc");

    if (payload.reload) {
      commit("updateField", { path: "group.groupCategories", value: data });
    } else {
      commit("updateField", {
        path: "group.groupCategories",
        value: _.concat(getters.getField("group.groupCategories"), data),
      });
    }

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupCategoriesAction state", state);
  }
};

export const fetchGroupMembersAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.members({
      groupId: payload.groupId,
      max: getters.getField("pagination.max"),
      offset: getters.getField("pagination.offset"),
      sort: getters.getField("sort.sort"),
      order: getters.getField("sort.order"),
      q: getters.getField("search.searchQuery"),
      groupStatusId: payload.groupStatusId,
    });
    commit("updateField", { path: "group.groupMembers", value: data });

    if (!_.isNumber(headers["x-pagination-total"])) {
      commit("updateField", {
        path: "pagination.total",
        value: _.toNumber(headers["x-pagination-total"]),
      });
    }

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupMembersAction", state);
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
      categoryId: getters.getField("search.searchCategoryId"),
    });
    if (payload.reload) {
      commit("updateField", {
        path: "group.groupList",
        value: data,
      });
    } else {
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
    dispatch("setLoadedState");
  } catch (error) {
    console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupListAction state", state);
  }
};

export const fetchGroupAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.show(payload.groupId);
    commit("updateField", {
      path: "group.groupItem",
      value: data,
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupAction state", state);
  }
};

export const saveGroupAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let r;
    if (payload.groupId == 0) {
      r = await payload.service.save(payload.groupItem);
    } else {
      r = await payload.service.update(payload.groupId, payload.groupItem);
    }
    // Reset the loading state after fetching
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: r.message,
    });
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const subscriptionAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  console.log("subscription", payload);
  try {
    dispatch("setLoadingState");
    let r;

    if (payload.subscribe) {
      r = await payload.service.subscribe(payload.groupId);
      commit("updateField", {
        path: "success",
        value: "Richiesta di iscrizione inviata (" + r.status + ")",
      });
    } else {
      r = await payload.service.unsubscribe(payload.groupId);
      commit("updateField", {
        path: "success",
        value: "Richiesta di disiscrizione inviata (" + r.status + ")",
      });
    }

    if (payload.mode == "single") {
      commit("updateField", {
        path: "group.groupItem",
        value: r.data,
      });
    } else {
      commit("updateGroupInList", { group: r.data });
    }

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("subscription state", state);
  }
};

export const inviteToGroupAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let r = await payload.service.invite(payload.groupId, {
      email: payload.invite.email,
      inviteText: payload.invite.inviteText,
      payload: payload.invite,
    });
    // Reset the loading state after
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: r.message,
    });
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const resetSearchAction = (
  { commit, dispatch, state, getters },
  payload
) => {
  commit("updateField", { path: "search.searchQuery", value: "" });
  commit("updateField", { path: "search.searchAddress", value: {} });
  commit("updateField", { path: "search.searchAddressString", value: "" });
  commit("updateField", { path: "search.searchCategoryId", value: 0 });
  commit("updateField", { path: "search.searchLatitude", value: 0.0 });
  commit("updateField", { path: "search.searchLatitude", value: 0.0 });
  commit("updateField", { path: "search.search", value: true });
  commit("updateField", { path: "search.searchDirty", value: false });
};
=======
export const setLoadingState = ({ commit }) => {
  commit("updateField", { path: "success", value: null });
  commit("updateField", { path: "error", value: null });
  commit("updateField", { path: "loading", value: true });
};

export const setLoadedState = ({ commit }, payload) => {
  commit("updateField", { path: "loading", value: false });
};

export const setErrorState = ({ commit }, error) => {
  commit("updateField", { path: "error", value: error });
  commit("updateField", { path: "loading", value: false });
};

export const fetchGroupCategoriesAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.list(100, 0, "name", "asc");

    if (payload.reload) {
      commit("updateField", { path: "group.groupCategories", value: data });
    } else {
      commit("updateField", {
        path: "group.groupCategories",
        value: _.concat(getters.getField("group.groupCategories"), data),
      });
    }

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupCategoriesAction state", state);
  }
};

export const fetchGroupMembersAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.members({
      groupId: payload.groupId,
      max: getters.getField("pagination.max"),
      offset: getters.getField("pagination.offset"),
      sort: getters.getField("sort.sort"),
      order: getters.getField("sort.order"),
      q: getters.getField("search.searchQuery"),
      groupStatusId: payload.groupStatusId,
    });
    commit("updateField", { path: "group.groupMembers", value: data });

    if (!_.isNumber(headers["x-pagination-total"])) {
      commit("updateField", {
        path: "pagination.total",
        value: _.toNumber(headers["x-pagination-total"]),
      });
    }

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupMembersAction", state);
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
      categoryId: getters.getField("search.searchCategoryId"),
    });
    if (payload.reload) {
      commit("updateField", {
        path: "group.groupList",
        value: data,
      });
    } else {
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
    dispatch("setLoadedState");
  } catch (error) {
    console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupListAction state", state);
  }
};

export const fetchGroupAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.show(payload.groupId);
    commit("updateField", {
      path: "group.groupItem",
      value: data,
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchGroupAction state", state);
  }
};

export const saveGroupAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let r;
    if (payload.groupId == 0) {
      r = await payload.service.save(payload.groupItem);
    } else {
      r = await payload.service.update(payload.groupId, payload.groupItem);
    }
    // Reset the loading state after fetching
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: r.message,
    });
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const subscriptionAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  console.log("subscription", payload);
  try {
    dispatch("setLoadingState");
    let r;

    if (payload.subscribe) {
      r = await payload.service.subscribe(payload.groupId);
      commit("updateField", {
        path: "success",
        value: "Richiesta di iscrizione inviata",
      });
    } else {
      r = await payload.service.unsubscribe(payload.groupId);
      commit("updateField", {
        path: "success",
        value: "Richiesta di disiscrizione inviata",
      });
    }

    if (payload.mode == "single") {
      commit("updateField", {
        path: "group.groupItem",
        value: r.data,
      });
    } else {
      commit("updateGroupInList", { group: r.data });
    }

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("subscription state", state);
  }
};

export const inviteToGroupAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let r = await payload.service.invite(payload.groupId, {
      email: payload.invite.email,
      inviteText: payload.invite.inviteText,
      payload: payload.invite,
    });
    // Reset the loading state after
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: r.message,
    });
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const resetSearchAction = (
  { commit, dispatch, state, getters },
  payload
) => {
  commit("updateField", { path: "search.searchQuery", value: "" });
  commit("updateField", { path: "search.searchAddress", value: {} });
  commit("updateField", { path: "search.searchAddressString", value: "" });
  commit("updateField", { path: "search.searchCategoryId", value: 0 });
  commit("updateField", { path: "search.searchLatitude", value: 0.0 });
  commit("updateField", { path: "search.searchLatitude", value: 0.0 });
  commit("updateField", { path: "search.search", value: true });
  commit("updateField", { path: "search.searchDirty", value: false });
};
>>>>>>> b93c39cf32d719a77b044e90c88e7373debc3e16
