//require axios @0.19.2 lodash@4.17.19

const axiosInstance = axios.create({
  headers: { Accept: "application/json" },
});

//DEFAULT
const LIST_ENDPOINT = "/group.json"; //GET
const GET_ENDPOINT = "/group/show.json"; //GET
const UPDATE_ENDPOINT = "/group/update"; //PUT
const SAVE_ENDPOINT = "/group/save"; //POST

export async function list(max, offset, sort, order) {
  const params = new URLSearchParams();

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(order) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  const { data, headers, status, statusText } = await axiosInstance.get(
    LIST_ENDPOINT,
    {
      params,
    }
  );

  console.log(
    "group data",
    data,
    "params",
    params.toString(),
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers };
}

// curl -i -H "Accept: application/json" http://localhost:8080/group?id=1

export async function show(id) {
  const params = new URLSearchParams();

  if (!_.isUndefined(id)) params.append("id", id);

  const { data, headers, status, statusText } = await axiosInstance.get(
    GET_ENDPOINT,
    {
      params,
    }
  );

  console.log(
    "group data",
    data,
    "params",
    params.toString(),
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers };
}

export async function update(id, payload) {
  const params = new URLSearchParams();

  if (!_.isUndefined(id)) params.append("id", id);

  const { data, headers, status, statusText } = await axios.put(
    UPDATE_ENDPOINT + "?id=" + id,
    payload
  );

  console.log(
    "group data",
    data,
    "params",
    params.toString(),
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { status, statusText };
}

export async function save(payload) {
  const { data, headers, status, statusText } = await axios.post(
    SAVE_ENDPOINT,
    {
      payload,
    }
  );

  console.log(
    "group data",
    data,
    "params",
    params.toString(),
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { status, statusText };
}
