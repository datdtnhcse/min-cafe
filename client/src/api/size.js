import axiosClient from "./axios.js";

const sizeApi = {
  get: (id) => {
    const url = `nuocuong/${id}`;
    return axiosClient.get(url);
  }
};

export default sizeApi;