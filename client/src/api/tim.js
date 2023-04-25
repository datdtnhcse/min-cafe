import axiosClient from "./axios.js";

const timApi = {
  get: (id) => {
    const url = `giophucvudoan/${id}`;
    return axiosClient.get(url);
  }
};

export default timApi;