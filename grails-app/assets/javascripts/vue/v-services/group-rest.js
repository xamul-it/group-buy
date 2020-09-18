//require axios @0.19.2 lodash@4.17.19

const axiosInstance = axios.create({});

//RESTFUL ENDPOINTS
const REST_ENDPOINT = "/api/v1/groups";

//RESTFUL codes
/*
show:
200 (OK)
404 (NOT_FOUND)
update:
200 (OK)
422 (UNPROCESSABLE_ENTITY)
save:
201 (CREATED)
422 (UNPROCESSABLE_ENTITY)
*/
const HTTP_CODES_MESSAGES_MAP = {
  200: "Gruppo aggiornato",
  201: "Gruppo creato",
  404: "Nessun gruppo trovato",
  422: "Errore durante il savataggio",
};

/*
HTTP Method 	URI 	                  Action
GET         /api/v1/groups             index/list
POST        /api/v1/groups             save
GET         /api/v1/groups/${id}       show
PUT         /api/v1/groups/${id}       update
DELETE      /api/v1/groups/${id}       delete
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
    "groups data",
    data,
    "params",
    params.toString(),
    "headers",
    headers,
    "status",
    status,
    statusText,
  );
  return { data, headers };
}

export async function show(id) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + id
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "group data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText,
    message
  );
  return { data, headers, status, message };
}

export async function update(id, payload) {
  console.log("update", REST_ENDPOINT + "/" + id, payload);
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "group data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText,
    message
  );

  return { status, message };
}

export async function save(payload) {
  console.log("save", REST_ENDPOINT, payload);
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT,
      payload,
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "group data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText,
    message
  );
  return { status, message };
}


export async function members(id) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + id + "/members"
  );

  console.log(
    "group members data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers, status };
}

export async function subscribe(id) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id + "/subscribe"
  );

  console.log(
    "group subscribe data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers, status, statusText };
}

export async function unsubscribe(id) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id + "/unsubscribe"
  );

  console.log(
    "group unsubscribe data",
    data,
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers, status, statusText };
}

