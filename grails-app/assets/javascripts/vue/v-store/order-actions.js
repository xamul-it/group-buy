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
      groupId: payload.groupId,
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

export const fetchSupplierOrderAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data } = await payload.service.showByHash(payload.orderHash);
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
    if (state.debug) console.log("fetchSupplierOrderAction state", state);
  }
};

export const saveOrderAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let r;
    if (payload.orderId == 0) {
      r = await payload.service.save(payload.groupId, payload.orderItem);
    } else {
      r = await payload.service.update(
        payload.groupId,
        payload.orderId,
        payload.orderItem
      );
    }
    // Reset the loading state after fetching
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: r.message,
    });
    return r.data;
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const saveOrderVoiceAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let r;
    if (payload.orderVoiceId == 0) {
      r = await payload.service.save(
        payload.groupId,
        payload.orderId,
        payload.orderVoiceItem
      );
    } else {
      r = await payload.service.update(
        payload.groupId,
        payload.orderId,
        payload.orderVoiceId,
        payload.orderVoiceItem
      );
    }
    // Reset the loading state after fetching
    dispatch("setLoadedState");

    console.log("saveOrderVoiceAction", r);
    commit("updateField", {
      path: "success",
      value: r.message,
    });
    return r.data;
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const deleteOrderVoiceAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");

    //Delete
    let r = await payload.service.del(
      payload.groupId,
      payload.orderId,
      payload.orderVoiceId
    );
    // Reset the loading state after fetching
    dispatch("setLoadedState");

    console.log("deleteOrderVoiceAction", r);
    if (r.status == 204) {
      commit("updateField", {
        path: "success",
        value: "Voce eliminata",
      });
    }
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const fetchSuppliersAction = async (
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
      q: payload.q,
    });

    commit("updateField", {
      path: "order.suppliers",
      value: data,
    });

    // Reset the loading state after fetching
    dispatch("setLoadedState");
  } catch (error) {
    console.log("catch error", error);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchSuppliersAction state", state);
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
