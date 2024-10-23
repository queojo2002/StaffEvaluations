import axios from "axios";

import { handleLogoutAPI, refreshTokenAPI } from "../apis";
import { openNotificationTopLeft } from "../utils/openNotification";

let apiInstance = axios.create();

apiInstance.defaults.timeout = 1000 * 60 * 10;

apiInstance.interceptors.request.use(
  (config) => {
    const access_token = localStorage.getItem("access_token");
    if (access_token) {
      config.headers.Authorization = `Bearer ${access_token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

let refreshTokenPromise = null;

apiInstance.interceptors.response.use(
  (response) => {
    if (response.config?.method === "post") {
      if (response.data?.isSuccess) {
        openNotificationTopLeft("success", "Thông báo!", response?.data?.message);
      } else {
        openNotificationTopLeft("warning", "Thông báo!", response?.data?.message);
      }
    }
    return response.data;
  },
  (error) => {
    const originalRequest = error.config;

    if (error.response?.status === 401 && originalRequest) {
      if (!refreshTokenPromise) {
        const access_token_old = localStorage.getItem("access_token");
        const refresh_token = localStorage.getItem("refresh_token");

        refreshTokenPromise = refreshTokenAPI(access_token_old, refresh_token)
          .then((res) => {
            const { accessToken, refreshToken } = res.data;

            localStorage.setItem("access_token", accessToken);

            localStorage.setItem("refresh_token", refreshToken);

            apiInstance.defaults.Authorization = `Bearer ${accessToken}`;
          })
          .catch((error) => {
            handleLogoutAPI().then(() => {
              location.href = "/";
            });

            return Promise.reject(error);
          })
          .finally(() => {
            refreshTokenPromise = null;
          });
      }

      return refreshTokenPromise.then(() => {
        return apiInstance(originalRequest);
      });
    }

    if (error.response?.status !== 401) {
      console.log(error);
      if (error.isSuccess && error.response?.data?.message) {
        openNotificationTopLeft("success", "Thông báo!", error.response?.data?.message);
      } else if (!error.isSuccess && error.response?.data?.message) {
        openNotificationTopLeft("error", "Thông báo!", error.response?.data?.message);
      } else {
        openNotificationTopLeft("error", "Thông báo!", error.message);
      }
    }

    return error;
  }
);

export default apiInstance;
