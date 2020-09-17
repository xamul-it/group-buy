//require axios @0.19.2 lodash@4.17.19

const axiosInstance = axios.create({});

//RESTFUL ENDPOINTS
const REST_ENDPOINT = "/api/v1/categories";

//RESTFUL codes
/*
show:
200 (OK)
404 (NOT_FOUND)
*/
const HTTP_CODES_MESSAGES_MAP = {
  404: "Nessuna categoria trovata",
};

/*
HTTP Method 	URI 	                      Action
GET         /api/v1/categories             index/list
GET         /api/v1/categories/${id}       show
* readOnly
*/


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
    "categories data",
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
    REST_ENDPOINT + "/" + id
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  console.log(
    "category data",
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