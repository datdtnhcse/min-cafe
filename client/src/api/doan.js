import axiosClient from "./axios.js";

const doanApi = {
  get: (id) => {
    const url = `doan/${id}`;
    return axiosClient.get(url);
  }
};

export default doanApi;