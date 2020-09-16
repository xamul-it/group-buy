//require axios @0.19.2 lodash@4.17.19

const axiosInstance = axios.create({
  /*headers: {
    common: {
      Accept: "application/json",
    },
    put: {
      "content-type": "application/json",
    },
    post: {
      "content-type": "application/json",
    },
  },*/
});

//RESTFUL ENDPOINTS
const REST_ENDPOINT = "/api/v1/groups";

/*
HTTP Method 	URI 	                  Action
GET         /api/v1/groups             index
GET         /api/v1/groups/create      create  *
POST        /api/v1/groups             save
GET         /api/v1/groups/${id}       show
GET         /api/v1/groups/${id}/edit  edit    *
PUT         /api/v1/groups/${id}       update
DELETE      /api/v1/groups/${id}       delete
* The create and edit actions are only needed if the controller exposes an HTML interface. 
*/
//https://docs.grails.org/latest/guide/REST.html#extendingRestfulController
// curl -i -H "Accept: application/json" /api/v1/groups

export async function list(max, offset, sort, order) {
  const params = new URLSearchParams();

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(order) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT,
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

export async function show(id) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + id
  );

  console.log(
    "group data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers };
}

export async function update(id, payload) {
  console.log("update", REST_ENDPOINT + "/" + id);
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id,
    payload
  );

  console.log(
    "group data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { status, statusText };
}

export async function save(payload) {
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT,
      payload,
  );

  console.log(
    "group data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { status, statusText };
}
