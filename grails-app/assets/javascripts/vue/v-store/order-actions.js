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

export const fetchOrderListAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.list({
      groupId: 1,
      max: getters.getField("pagination.max"),
      offset: getters.getField("pagination.offset"),
      sort: getters.getField("sort.sort"),
      order: getters.getField("sort.order"),
    });
    if (payload.reload) {
      commit("updateField", {
        path: "order.orderList",
        value: data,
      });
    } else {
      commit("updateField", {
        path: "order.orderList",
        value: _.concat(getters.getField("order.orderList"), data),
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
    if (state.debug) console.log("fetchOrderListAction state", state);
  }
};

export const fetchOrderAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.show(
      payload.groupId,
      payload.orderId
    );
    commit("updateField", {
      path: "order.orderItem",
      value: data,
    });
    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchOrderAction state", state);
  }
};

export const saveOrderAction = async (
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
