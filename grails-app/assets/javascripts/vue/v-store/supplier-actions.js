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
/*
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
*/
