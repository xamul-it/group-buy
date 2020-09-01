//require axios

const REVERSE_ENDPOINT = "https://nominatim.openstreetmap.org/reverse";
const FORWARD_ENDPOINT = "https://nominatim.openstreetmap.org/search";
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

  console.log("data", data);
  return data.address;
}

export async function coordinatesByAddress(address) {
  const { data } = await axios.get(FORWARD_ENDPOINT, {
    params: {
      extratags: 0,
      addressdetails: 0,
      namedetails: 0,
      countrycodes: "it",
      limit: 1,
      format: FORMAT,
      q: address,
    },
  });

  console.log("data[0]", data[0]);
  return { latitude: data[0].lat, longitude: data[0].lon };
}

export async function currentAddress() {
  const coordinates = await currentCoordinates();
  console.log("browser coordinates", coordinates);
  return addressByCoordinates(coordinates);
}
