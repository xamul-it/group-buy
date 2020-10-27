//require axios @0.19.2 lodash@4.17.19

const axiosInstance = axios.create({});

//RESTFUL ENDPOINTS
const REST_ENDPOINT = "/api/v1/groups";
const ORDERS_ENDPOINT = "/orders";
const VOICES_ENDPOINT = "/voices";

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
  200: "Voce aggiornata",
  201: "Voce creata",
  404: "Nessuna voce trovata",
  422: "Errore durante il savataggio",
};

/*
HTTP Method 	URI 	                                                      Action
GET         /api/v1/groups/${groupId}/orders/${orderId}/voices            index/list
POST        /api/v1/groups/${groupId}/orders/${orderId}/voices            save
GET         /api/v1/groups/${groupId}/orders/${orderId}/voices/${id}      show
PUT         /api/v1/groups/${groupId}/orders/${orderId}/voices/${id}      update
DELETE      /api/v1/groups/${groupId}/orders/${orderId}/voices/${id}      delete
*/
//https://docs.grails.org/latest/guide/REST.html#extendingRestfulController

export async function list({
  groupId,
  orderId,
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
    REST_ENDPOINT +
      "/" +
      groupId +
      ORDERS_ENDPOINT +
      "/" +
      orderId +
      VOICES_ENDPOINT,
    {
      params,
    }
  );
  return { data, headers };
}

export async function show(groupId, orderId, id) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT +
      "/" +
      groupId +
      ORDERS_ENDPOINT +
      "/" +
      orderId +
      VOICES_ENDPOINT +
      "/" +
      id
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, headers, status, message };
}

export async function update(groupId, orderId, id, payload) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT +
      "/" +
      groupId +
      ORDERS_ENDPOINT +
      "/" +
      orderId +
      VOICES_ENDPOINT +
      "/" +
      id,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, status, message };
}

export async function save(groupId, orderId, payload) {
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT +
      "/" +
      groupId +
      ORDERS_ENDPOINT +
      "/" +
      orderId +
      VOICES_ENDPOINT,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];

  return { data, status, message };
}
