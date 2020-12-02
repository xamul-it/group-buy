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
