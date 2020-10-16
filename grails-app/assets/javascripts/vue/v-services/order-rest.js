//require axios @0.19.2 lodash@4.17.19

const axiosInstance = axios.create({});

//RESTFUL ENDPOINTS
const REST_ENDPOINT = "/api/v1/groups";
const ORDERS_ENDPOINT = "/orders";

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
  200: "Ordine aggiornato",
  201: "Ordine creato",
  404: "Nessun ordine trovato",
  422: "Errore durante il savataggio",
};

/*
HTTP Method 	URI 	                              Action
GET         /api/v1/groups/${id}/orders            index/list
POST        /api/v1/groups/${id}/orders            save
GET         /api/v1/groups/${id}/orders/${id}      show
PUT         /api/v1/groups/${id}/orders/${id}      update
DELETE      /api/v1/groups/${id}/orders/${id}      delete
*/
//https://docs.grails.org/latest/guide/REST.html#extendingRestfulController

export async function list({
  groupId,
  max,
  offset = 0,
  sort = "",
  order = "",
}) {
  const params = new URLSearchParams();

  console.log(
    "list",
    "max",
    max,
    "offset",
    offset,
    "sort",
    sort,
    "order",
    order
  );

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(sort) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT,
    {
      params,
    }
  );

  console.log(
    "orders data",
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

export async function show(groupId, orderId) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT + "/" + orderId
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "order data",
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

export async function update(groupId, id, payload) {
  console.log(
    "update",
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT + "/" + id,
    payload
  );
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT + "/" + id,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "order data",
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

export async function save(groupId, payload) {
  console.log("save", REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT, payload);
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "order data",
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
