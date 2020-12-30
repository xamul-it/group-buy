//require axios lodash

const axiosInstance = axios.create({});

//RESTFUL ENDPOINTS
const REST_ENDPOINT = "/api/v1/users";

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
  200: "Utente aggiornato",
  201: "Utente creato",
  404: "Nessun utente trovato",
  422: "Errore durante il savataggio",
};

/*
HTTP Method 	URI 	                  Action
GET         /api/v1/users             index/list
POST        /api/v1/users             save
GET         /api/v1/users/${id}       show
PUT         /api/v1/users/${id}       update
DELETE      /api/v1/users/${id}       delete
GET         /api/v1/users/get         get logged in user
*/

export async function get() {
  const { data, headers, status, statusText } = await axiosInstance.get(
    REST_ENDPOINT + "/get"
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
  return { status, message };
}