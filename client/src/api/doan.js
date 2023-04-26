import axiosClient from "./axios.js";

const doanApi = {
  get: (id) => {
    const url = `doan/${id}`;
    return axiosClient.get(url);
  },
  post: (data) => {
    const url = `doan/`;
    return axiosClient.post(url, data);
  }
};

export default doanApi;