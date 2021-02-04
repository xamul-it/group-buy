//require axios

//https://operations.osmfoundation.org/policies/nominatim/
const REVERSE_ENDPOINT = "https://nominatim.openstreetmap.org/reverse"; //https://nominatim.org/release-docs/develop/api/Reverse/
const FORWARD_ENDPOINT = "https://nominatim.openstreetmap.org/search"; //https://nominatim.org/release-docs/develop/api/Search/
const FORMAT = "jsonv2";

export function currentCoordinates() {
  return new Promise((resolve, reject) => {
    navigator.geolocation.getCurrentPosition(
      ({ coords }) => resolve(coords),
      (error) => reject(error),
      { maximumAge: 60000, timeout: 8000, enableHighAccuracy: true }
    );
  });
}

export async function addressByCoordinates({ latitude, longitude }) {
  const { data } = await axios.get(REVERSE_ENDPOINT, {
    params: {
      extratags: 0,
      addressdetails: 1,
      namedetails: 0,
      format: FORMAT,
      lat: latitude,
      lon: longitude,
    },
  });

  console.log("addressByCoordinates", "data", data);
  return data.address;
}

export async function coordinatesByAddress(address) {
  try {
    const { data } = await axios.get(FORWARD_ENDPOINT, {
      params: {
        extratags: 0,
        addressdetails: 1,
        namedetails: 0,
        countrycodes: "it",
        limit: 1,
        format: FORMAT,
        q: address,
      },
    });

    console.log(
      "coordinatesByAddress",
      address,
      data[0].address,
      "data[0]",
      data[0]
    );
    return { latitude: data[0].lat, longitude: data[0].lon };
  } catch (error) {
    console.log("coordinatesByAddress error", error);
    throw { error, message: "Nessun risultato trovato" };
  }
}

export async function currentAddress() {
  let coordinates;
  try {
    coordinates = await currentCoordinates();
    console.log("currentAddress browser coordinates", coordinates);
  } catch (error) {
    console.log("currentAddress coordinates error", error);
    throw { error, message: "Localizzazione momentaneamente non disponibile" };
  }

  let address;
  try {
    address = await addressByCoordinates(coordinates);
    console.log("currentAddress address", address);
  } catch (error) {
    console.log("currentAddress address error", error);
    throw { error, message: "Geocoding momentaneamente non disponibile" };
  }

  return { currentCoordinates: coordinates, currentAddress: address };
}
