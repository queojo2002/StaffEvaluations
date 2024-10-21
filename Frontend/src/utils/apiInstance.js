import axios from "axios";

import { handleLogoutAPI, refreshTokenAPI } from "../apis";

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

    return error;
  }
);

export default apiInstance;
