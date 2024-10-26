import apiInstance from "../utils/apiInstance";
import { BACKEND_API } from "../utils/constants";

export const handleLogoutAPI = async () => {
  localStorage.removeItem("access_token");
  localStorage.removeItem("refresh_token");
};

export const refreshTokenAPI = async (access_token, refresh_token) => {
  return await apiInstance.put(`${BACKEND_API}/api/v1/renewToken`, {
    accessToken: access_token,
    refreshToken: refresh_token
  });
};

export const getListMenuOfUser = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/getListMenuOfUser`);
};

export const getAllUnit = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/unit/getAll`);
};

export const insertListUnit = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/unit/insertListUnit`, {
    unitName: values.unitName,
    parentId: values.parentId
  });
};

export const deleteListUnit = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/unit/deleteListUnit`, ids);
};

export const getAllRoles = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/roles/getAllRoles`);
};

export const getAllMenuItems = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/roles/getAllMenuItems`);
};

export const getAllMenuItemsByRoleId = async (roleId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/roles/getAllMenuItemsByRoleId?roleId=${roleId}`);
};

export const insertRoleAndMenuItems = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/roles/insertRoleAndMenuItems`, {
    roleName: values.roleName,
    menuItems: values.menuItems
  });
};

export const updateRoleAndMenuItems = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/roles/updateRoleAndMenuItems`, {
    roleId: values.roleId,
    roleName: values.roleName,
    menuItems: values.menuItems
  });
};

export const removeRangeRoleAndMenuItems = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/roles/removeRangeRoleAndMenuItems`, ids);
};
