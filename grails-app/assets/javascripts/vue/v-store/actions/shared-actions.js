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
