import axiosClient from "./axios.js";

const timApi = {
  get: (id) => {
    const url = `giophucvudoan/${id}`;
    return axiosClient.get(url);
  },
  post: (data) => {
    const url = `giophucvudoan/`;
    return axiosClient.post(url, data);
  }
};

export default timApi;