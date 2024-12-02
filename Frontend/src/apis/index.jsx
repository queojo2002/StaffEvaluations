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

export const getAllEvaluationSample = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationSample/getAll`);
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

export const getAllUserInUnit = async (unitId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/getListUserInUnit?unitId=${unitId}`);
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

export const getUsersAllowedToEvaluate = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationUser/getUsersAllowedToEvaluate/${evaluationId}`);
};

export const getUsersNotAllowedToEvaluate = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationUser/getUsersNotAllowedToEvaluate/${evaluationId}`);
};

export const getAllNonSupervisorUsers = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationUser/getAllNonSupervisorUsers/${evaluationId}`);
};

export const getSupervisorsForEvaluation = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationUser/getSupervisorsForEvaluation/${evaluationId}`);
};

export const getAllCATEvaluationAvailable = async (evaluationConsolidationAndTransferId) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/getAllEvaluationAvailable/${evaluationConsolidationAndTransferId}`
  );
};

export const getAllCATEvaluationsByConsolidationId = async (evaluationConsolidationAndTransferId) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/getAllEvaluationsByConsolidationId/${evaluationConsolidationAndTransferId}`
  );
};

export const getAllEvaluationExplaintWithUser = async (values) => {
  return await apiInstance.put(`${BACKEND_API}/api/v1/evaluationExplaint/getAllWithUser`, {
    evaluationId: values.evaluationId,
    categoryCriteriaId: values.categoryCriteriaId,
    userIds: values.userIds
  });
};

export const getAllEvaluationExplaintWithSupervisor = async (values) => {
  return await apiInstance.put(`${BACKEND_API}/api/v1/evaluationExplaint/getAllWithSupervisor`, {
    evaluationId: values.evaluationId,
    categoryCriteriaId: values.categoryCriteriaId,
    userId: values.userId,
    userIds: values.userIds
  });
};

export const getAllEvaluationConsolidationAndTransfer = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/getAll`);
};

export const getAllEvaluationConsolidationAndTransferCompleted = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/getAllWithCompleted`);
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

export const insertEvaluationSample = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationSample/insert`, values);
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

export const insertEvaluationConsolidationAndTransfer = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/insert`, values);
};

export const insertAndRemoveListEvaluationCriteria = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationCriteria/insertAndRemoveList`, {
    evaluationIds: values.evaluationIds,
    listCategoryCriteriaId: values.listCategoryCriteriaId
  });
};

export const insertAndRemoveListEvaluationCriteriaSample = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationCriteriaSample/insertAndRemoveList`, {
    evaluationSampleId: values.evaluationSampleId,
    listCategoryCriteriaId: values.listCategoryCriteriaId
  });
};

export const insertUserIntoEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationUser/insertUserIntoEvaluation`, {
    evaluationId: values.evaluationId,
    userIds: values.userIds
  });
};

export const insertSupervisorIntoEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationUser/insertSupervisorIntoEvaluation`, {
    evaluationId: values.evaluationId,
    userId: values.userId,
    sort: values.sort,
    isManager: values.isManager
  });
};

export const insertEvaluationIntoCATD = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/insertEvaluationIntoCATD`, {
    evaluationConsolidationAndTransferId: values.evaluationConsolidationAndTransferId,
    evaluationIds: values.evaluationIds
  });
};

export const insertEvaluationExplaint = async (values) => {
  const formData = new FormData();

  formData.append("modelPayload.EvaluationId", values.evaluationId);
  formData.append("modelPayload.CategoryCriteriaId", values.categoryCriteriaId);
  formData.append("modelPayload.Note", values.note);
  formData.append("modelPayload.Type", values.type);

  if (values.userId) {
    formData.append("modelPayload.UserId", values.userId);
  }

  if (values.fileAttachments) {
    formData.append("fileAttachments", values.fileAttachments);
  }

  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationExplaint/insert`, formData, {
    headers: {
      "Content-Type": "multipart/form-data"
    }
  });
};

export const insertEvaluationDetailsPersonal = async (values, file) => {
  const formData = new FormData();
  formData.append("evaluationDetailsPersonalCustom", JSON.stringify(values));
  if (file) {
    formData.append("file", file);
  }
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationDetailsPersonal/insertAndUpdateCustom`, formData, {
    headers: {
      "Content-Type": "multipart/form-data"
    }
  });
};

export const insertEvaluationDetailsSupervisor = async (values, file) => {
  const formData = new FormData();
  formData.append("evaluationDetailsSupervisorCustom", JSON.stringify(values));
  if (file) {
    formData.append("file", file);
  }
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationDetailsSupervisor/insertAndUpdateCustom`, formData, {
    headers: {
      "Content-Type": "multipart/form-data"
    }
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

export const getEvaluationSampleById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationSample/${id}`);
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

export const getListCriteriaByIdEvaluation = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationCriteria/getListCriteria/${id}`);
};

export const getListCriteriaByIdEvaluationSample = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationCriteriaSample/getListCriteria/${id}`);
};

export const getEvaluationCriteriaById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationCriteria/${id}`);
};

export const getEvaluationCriteriaSampleById = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationCriteriaSample/${id}`);
};

export const getEvaluationOfUser = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluation/getEvaluationOfUser`);
};

export const getEvaluationOfSupervisor = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluation/getEvaluationOfSupervisor`);
};

export const getListCriteriaInEvaluationsOfUser = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationCriteria/getListCriteriaInEvaluationsOfUser/${id}`);
};

export const getListCriteriaInEvaluationsOfUserCustom = async (id) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationCriteria/getListCriteriaInEvaluationsOfUserCustom/${id}`
  );
};

export const getListCriteriaInEvaluationsOfSupervisor = async (evaluationId, idUser) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationCriteria/getListCriteriaInEvaluationsOfSupervisor?evaluationId=${evaluationId}&idUser=${idUser}`
  );
};

export const getListCriteriaInEvaluationsOfSupervisorCustom = async (evaluationId, idUser) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationCriteria/getListCriteriaInEvaluationsOfSupervisorCustom?evaluationId=${evaluationId}&idUser=${idUser}`
  );
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

export const updateEvaluationSample = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationSample/update`, values);
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

export const updateSortEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationCriteria/updateSort`, {
    evaluationId: values.evaluationId,
    listCategoryCriterias: values.listCategoryCriterias
  });
};

export const updateSortEvaluationCriteriaSample = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationCriteriaSample/updateSort`, {
    evaluationSampleId: values.evaluationSampleId,
    listCategoryCriterias: values.listCategoryCriterias
  });
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

export const removeEvaluationConsolidationAndTransfer = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/removeRange`, ids);
};

export const removeCategoryComment = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/categoryComment/removeRange`, ids);
};

export const removeEvaluation = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluation/removeRange`, ids);
};

export const removeEvaluationSample = async (ids) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationSample/removeRange`, ids);
};

export const removeUserFromEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationUser/removeUserFromEvaluation`, {
    evaluationId: values.evaluationId,
    userIds: values.userIds
  });
};

export const removeSupervisorFromEvaluation = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationUser/removeSupervisorFromEvaluation`, {
    evaluationId: values.evaluationId,
    userId: values.userId,
    sort: 0
  });
};

export const removeEvaluationFromCATD = async (values) => {
  return await apiInstance.post(`${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/removeEvaluationFromCATD`, {
    evaluationConsolidationAndTransferId: values.evaluationConsolidationAndTransferId,
    evaluationIds: values.evaluationIds
  });
};

export const downloadSignature = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/downloadSignature?id=${id}`, {
    responseType: "blob"
  });
};

export const checkIsManager = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationUser/checkIsManager/${evaluationId}`);
};

export const checkIsManagementMember = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/user/checkIsManagementMember`);
};

export const exportEvaluationDocument = async (evaluationId, templateType, outputFormat) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/analyst/exportEvaluationDocument?evaluationId=${evaluationId}&templateType=${templateType}&outputFormat=${outputFormat}`,
    {
      responseType: "blob"
    }
  );
};

export const exportPdfOfUser = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/analyst/exportPdfOfUser?evaluationId=${evaluationId}`, {
    responseType: "blob"
  });
};

export const exportExcelOfUser = async (evaluationId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/analyst/exportExcelOfUser?evaluationId=${evaluationId}`, {
    responseType: "blob"
  });
};

export const exportUserEvaluationDataToExcel = async (userId) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/analyst/exportUserEvaluationDataToExcel?userId=${userId}`, {
    responseType: "blob"
  });
};

export const exportWordSampleCAT = async (evaluationConsolidationAndTransferId) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/exportWordAnalystSample?evaluationConsolidationAndTransferId=${evaluationConsolidationAndTransferId}`,
    {
      responseType: "blob"
    }
  );
};

export const getFileAttachments = async (id) => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/evaluationExplaint/getFileAttachments?id=${id}`, {
    responseType: "blob"
  });
};

export const confirmConsolidationAndTransferEvaluations = async (values) => {
  const formData = new FormData();

  formData.append("evaluationConsolidationAndTransferId", values.evaluationConsolidationAndTransferId);

  if (values.fileWord) {
    formData.append("files", values.fileWord);
  }

  if (values.fileES) {
    formData.append("files", values.fileES);
  }

  return await apiInstance.post(
    `${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/confirmConsolidationAndTransferEvaluations`,
    formData,
    {
      headers: {
        "Content-Type": "multipart/form-data"
      }
    }
  );
};

export const exportAnalystConsolidationAndTransfer = async (evaluationConsolidationAndTransferId, numberTemplate) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluationConsolidationAndTransfer/exportAnalystConsolidationAndTransfer?evaluationConsolidationAndTransferId=${evaluationConsolidationAndTransferId}&numberTemplate=${numberTemplate}`,
    {
      responseType: "blob"
    }
  );
};

export const getAnalyst = async () => {
  return await apiInstance.get(`${BACKEND_API}/api/v1/dashBoard/getAnalyst`);
};

export const sendMailAPI = async (userId, evaluationId) => {
  return await apiInstance.get(
    `${BACKEND_API}/api/v1/evaluation/sendMail?userId=${userId}&evaluationId=${evaluationId}`
  );
};
