//
export const fetchAddressActionHelper = async (
  { commit, dispatch, state },
  payload
) => {
  let {
    currentCoordinates,
    currentAddress,
  } = await payload.service.currentAddress();

  currentAddress.latitude = currentCoordinates.latitude;
  currentAddress.longitude = currentCoordinates.longitude;

  return {
    currentCoordinates,
    currentAddress,
  };
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
