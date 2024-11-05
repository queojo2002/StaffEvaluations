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

export const getAllUser = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/getAll`);
};

export const getAllUserType = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/userType/getAll`);
};

export const getAllCategoryRating = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryRating/getAll`);
};

export const getAllCategoryTimeType = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryTimeType/getAll`);
};

export const getAllCategoryCriteria = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryCriteria/getAll`);
};

export const getAllCategoryProsCons = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryProsCons/getAll`);
};

export const getAllCategoryComment = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryComment/getAll`);
};

export const getAllEvaluation = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluation/getAll`);
};

export const insertListUnit = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/unit/insertListUnit`, {
    unitName: values.unitName,
    parentId: values.parentId
  });
};

export const insertRoleAndMenuItems = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/roles/insertRoleAndMenuItems`, {
    roleName: values.roleName,
    menuItems: values.menuItems
  });
};

export const insertUserType = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/userType/insert`, values);
};

export const insertUser = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/user/insert`, values);
};

export const insertCategoryRating = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryRating/insert`, values);
};

export const insertCategoryTimeType = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryTimeType/insert`, values);
};

export const insertCategoryCriteria = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryCriteria/insert`, values);
};

export const insertCategoryProsCons = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryProsCons/insert`, values);
};

export const insertCategoryComment = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryComment/insert`, values);
};

export const insertEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluation/insert`, values);
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

export const getUserTypeById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/userType/${id}`);
};

export const getUserById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/${id}`);
};

export const getCategoryRatingById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryRating/${id}`);
};

export const getCategoryTimeTypeById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryTimeType/${id}`);
};

export const getCategoryCriteriaById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryCriteria/${id}`);
};

export const getCategoryProsConsById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryProsCons/${id}`);
};

export const getCategoryCommentById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/categoryComment/${id}`);
};

export const getEvaluationById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluation/${id}`);
};

export const updateRoleAndMenuItems = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/roles/updateRoleAndMenuItems`, {
    roleId: values.roleId,
    roleName: values.roleName,
    menuItems: values.menuItems
  });
};

export const updateListEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluation/updateList`, {
    evaluationIds: values.evaluationIds,
    categoryTimeTypeId: values.categoryTimeTypeId
  });
};

export const updateUserType = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/userType/update`, values);
};

export const updateUser = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/user/update`, values);
};

export const updateCategoryRating = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryRating/update`, values);
};

export const updateCategoryTimeType = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryTimeType/update`, values);
};

export const updateCategoryCriteria = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryCriteria/update`, values);
};

export const updateCategoryProsCons = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryProsCons/update`, values);
};

export const updateCategoryComment = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryComment/update`, values);
};

export const updateEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluation/update`, values);
};

export const removeRangeRoleAndMenuItems = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/roles/removeRangeRoleAndMenuItems`, ids);
};

export const removeRangeUserType = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/userType/removeRange`, ids);
};

export const removeRangeUser = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/user/removeRange`, ids);
};

export const removeCategoryRating = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryRating/removeRange`, ids);
};

export const removeCategoryTimeType = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryTimeType/removeRange`, ids);
};

export const removeCategoryCriteria = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryCriteria/removeRange`, ids);
};

export const removeCategoryProsCons = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryProsCons/removeRange`, ids);
};

export const removeCategoryComment = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryComment/removeRange`, ids);
};

export const removeEvaluation = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluation/removeRange`, ids);
};

export const downloadSignature = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/downloadSignature?id=${id}`, {
    responseType: "blob"
  });
};
