import apiInstance from "../utils/apiInstance";
import { BACKEND_API } from "../utils/constants";

export const refreshTokenAPI = async (access_token, refresh_token) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/renewToken`, {
    accessToken: access_token,
    refreshToken: refresh_token
  });
};

export const handleLogoutAPI = async () => {
  localStorage.removeItem("access_token");
  localStorage.removeItem("refresh_token");
};
