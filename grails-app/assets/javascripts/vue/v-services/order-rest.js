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
HTTP Method 	URI 	                                    Action
GET         /api/v1/groups/${groupId}/orders            index/list
POST        /api/v1/groups/${groupId}/orders            save
GET         /api/v1/groups/${groupId}/orders/${id}      show
PUT         /api/v1/groups/${groupId}/orders/${id}      update
DELETE      /api/v1/groups/${groupId}/orders/${id}      delete
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

  return { data, headers };
}

export async function show(groupId, orderId) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT + "/" + orderId
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];

  return { data, headers, status, message };
}

export async function showByHash(orderHash) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    "/api/v1" + ORDERS_ENDPOINT + "/" + orderHash
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];

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

  return { status, message };
}

export async function save(groupId, payload) {
  console.log("save", REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT, payload);
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];

  return { status, message };
}

export const ORDER_STATUS = {
  SENT: "sent",
  ACCEPTED: "accepted",
  REJECTED: "rejected",
  SHIPPED: "shipped",
  DELIVERED: "delivered",
};

export async function changeStatusById(groupId, id, action) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + groupId + ORDERS_ENDPOINT + "/" + id + "/" + action
  );
  return { data, headers, status, statusText };
}

export async function changeStatusByHash(orderToken, action) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    "/api/v1" + ORDERS_ENDPOINT + "/" + orderToken + "/" + action
  );
  return { data, headers, status, statusText };
}
