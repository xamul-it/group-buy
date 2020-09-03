//require axios @0.19.2 lodash@4.17.19

const LIST_ENDPOINT = "/group.json"; //"/group/list.json";
const ITEM_ENDPOINT = "https://nominatim.openstreetmap.org/search";

export async function groupList(max, offset, sort, order) {
  const params = new URLSearchParams();

  if (!_.isUndefined(max)) params.append("max", max);
  if (!_.isUndefined(offset)) params.append("offset", offset);

  if (!_.isUndefined(order) && sort != "") params.append("sort", sort);
  if (!_.isUndefined(order) && order != "") params.append("order", order);

  const { data } = await axios.get(LIST_ENDPOINT, { params });

  console.log("group data", data, "params", params.toString());
  return data;
}
