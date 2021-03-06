//require axios
//require lodash

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
  500: "500 Errore server"
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

export async function list({
  max,
  offset = 0,
  sort = "",
  order = "",
  q = "",
  latitude = 0.0,
  longitude = 0.0,
  categoryId = 0,
  userId = 0,
}) {
  const params = new URLSearchParams();

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(sort) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  if (!_.isUndefined(q) && q != "") params.append("src", q);
  if (!_.isUndefined(latitude) && latitude != 0.0)
    params.append("latitude", latitude);
  if (!_.isUndefined(longitude) && longitude != 0.0)
    params.append("longitude", longitude);
  if (!_.isUndefined(categoryId) && categoryId != 0)
    params.append("categoryId", categoryId);
  if (!_.isUndefined(userId) && userId != 0) params.append("userId", userId);

  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT,
    {
      params,
    }
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, headers, status, message };
}

export async function show(id) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + id
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, headers, status, message };
}

export async function update(id, payload) {
  console.log("update", REST_ENDPOINT + "/" + id, payload);
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, status, message };
}

export async function save(payload) {
  console.log("save", REST_ENDPOINT, payload);
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT,
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, headers, status, message };
}

export async function members({
  groupId,
  max,
  offset = 0,
  sort = "",
  order = "",
  q = "",
  groupStatusId = -1,
}) {
  const params = new URLSearchParams();

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(sort) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  if (!_.isUndefined(q) && q != "") params.append("src", q);
  if (!_.isUndefined(groupStatusId) && groupStatusId != -1)
    params.append("groupStatusId", groupStatusId);

  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/" + groupId + "/members",
    {
      params,
    }
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { data, headers, status, message };
}

export async function subscribe(id) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id + "/subscribe"
  );

  return { data, headers, status, statusText };
}

export async function unsubscribe(id) {
  const { data, headers, status, statusText } = await axiosInstance.put(
    REST_ENDPOINT + "/" + id + "/unsubscribe"
  );

  return { data, headers, status, statusText };
}

export async function invite(id, { email, inviteText, payload }) {
  const params = new URLSearchParams();
  if (!_.isUndefined(email)) params.append("email", email);
  if (!_.isUndefined(inviteText)) params.append("inviteText", inviteText);

  console.log("update", REST_ENDPOINT + "/" + id + "/invite", params, payload);
  const { data, headers, status, statusText } = await axiosInstance.post(
    REST_ENDPOINT + "/" + id + "/invite",
    payload
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { status, message };
}
