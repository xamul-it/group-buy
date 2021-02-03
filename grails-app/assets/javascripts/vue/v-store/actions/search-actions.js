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
