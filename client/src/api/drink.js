import axiosClient from "./axios.js";

const drinkApi = {
  post: (data) => {
    const url = `nuoc/`;
    return axiosClient.post(url, data);
  }
};

export default drinkApi;