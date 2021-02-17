export const fetchUserAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let { data, headers } = await payload.service.get();
    commit("updateField", {
      path: "user.userItem",
      value: data,
    });
    dispatch("setLoadedState");
  } catch (error) {
    if (state.debug) console.log("catch error", error, error.response);
    dispatch("setErrorState", error.message);
  } finally {
    if (state.debug) console.log("fetchUserAction state", state);
  }
};

export const saveUserAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let u = await payload.service.update(payload.userId, payload.userItem);
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: u.message,
    });
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};

export const updateUserPasswordAction = async (
  { commit, dispatch, state, getters },
  payload
) => {
  try {
    dispatch("setLoadingState");
    let u = await payload.service.updateUserPassword(
      payload.formData,
      payload.postHeaders
    );
    dispatch("setLoadedState");
    commit("updateField", {
      path: "success",
      value: u.message,
    });
  } catch (error) {
    if (state.debug)
      console.log("catch error", error, error.response, error.response.data);
    dispatch("setErrorState", error);
  }
};
