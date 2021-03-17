//require axios
//require lodash

const axiosInstance = axios.create({});

//RESTFUL ENDPOINTS
const REST_ENDPOINT_PREFIX = "/api/v1/";
let rest_endpoint = "";
//RESTFUL codes
/*
show:
200 (OK)
404 (NOT_FOUND)
*/

const HTTP_CODES_MESSAGES_MAP = {
  200: "Found",
  301: "Permanent redirect",
  404: "Not found",
};
let http_codes_messages_map = {};

/*
HTTP Method 	URI 	                            Action
GET         /api/v1/{rest_endpoint}             index/list
GET         /api/v1/{rest_endpoint}/${id}       show
* readOnly
*/

export function setResourceEndpoint(endpoint) {
  rest_endpoint = REST_ENDPOINT_PREFIX + endpoint;
}

export function set404Message(message) {
  http_codes_messages_map[404] = message;
}

export async function list(max, offset, sort, order) {
  const params = new URLSearchParams();

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(order) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  const { data, headers, status, statusText } = await axiosInstance.get(
    rest_endpoint,
    {
      params,
    }
  );

  let message = http_codes_messages_map[status]
    ? http_codes_messages_map[status]
    : HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    rest_endpoint + " data",
    data,
    "params",
    params.toString(),
    "headers",
    headers,
    "status",
    status,
    statusText
  );
  return { data, headers, status };
}

export async function show(id) {
  const { data, headers, status, statusText } = await axiosInstance.get(
    rest_endpoint + "/" + id
  );

  let message = http_codes_messages_map[status]
    ? http_codes_messages_map[status]
    : HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    rest_endpoint + " data",
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
