import axiosClient from "./axios.js";

const sizeApi = {
  get: (id) => {
    const url = `nuocuong/${id}`;
    return axiosClient.get(url);
  },
  post: (data) => {
    const url = `nuocuong/`;
    return axiosClient.post(url, data);
  }
};

export default sizeApi;