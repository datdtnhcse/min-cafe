// import axiosClient from './axios.js'

// export class monanApi {
//   endpoint = '/monan'

//   async search(data) {
//     console.log("======================")
//     return axiosClient.post(`${this.endpoint}/`, data)
//   }
// }

// export default monanApi;

import axiosClient from "./axios.js";

const monanApi = {
  search: (data) => {
    const url = `monan/`;
    return axiosClient.post(url, data);
  },
  get: (id) => {
    const url = `monan/${id}`;
    return axiosClient.get(url);
  },

};

export default monanApi;