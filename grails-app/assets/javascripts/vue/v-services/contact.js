//require axios
//require lodash

const axiosInstance = axios.create({});

const API_ENDPOINT = "/api/v1/contact";

//API codes
/*
contact:
200 (OK)
201 (CREATED)
*/
const HTTP_CODES_MESSAGES_MAP = {
  200: "Richiesta inviata, Grazie",
  201: "Richiesta inviata, Grazie",
};

/*
HTTP Method 	URI 	                  Action
POST         /api/v1/contact             contact
*/

export async function sendContact({ emailAddress, messageText, privacy }) {
  console.log("contact", API_ENDPOINT + "/contact", {
    emailAddress,
    messageText,
    privacy,
  });
  const { data, headers, status, statusText } = await axiosInstance.post(
    API_ENDPOINT + "/contact",
    {
      emailAddress,
      messageText,
      privacy,
    },
    {
      params: {
        emailAddress,
        messageText,
        privacy,
      },
    }
  );

  let message = HTTP_CODES_MESSAGES_MAP[status];
  return { status, message };
}
