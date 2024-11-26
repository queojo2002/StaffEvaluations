import { useEffect, useRef, useState } from "react";
import { CloseOutlined, EditOutlined, SaveOutlined, SendOutlined } from "@ant-design/icons";
import { Button, Col, Drawer, Input, Modal, Row, Space, Table, Tabs, Tag, Typography } from "antd";

import EvaluationDetailsUserPrint from "./EvaluationDetailsUserComponents/EvaluationDetailsUserPrint";
import EvaluationSubmissionConfirmation from "./EvaluationDetailsUserComponents/EvaluationSubmissionConfirmation";
import ManagerExclusiveSection from "./EvaluationDetailsUserComponents/ManagerExclusiveSection";
import NewAndUpdateEvaluationExplaint from "./EvaluationDetailsUserComponents/NewAndUpdateEvaluationExplaint";
import SelfEvaluationResults from "./EvaluationDetailsUserComponents/SelfEvaluationResults";
import SelfReviewAndQualityRating from "./EvaluationDetailsUserComponents/SelfReviewAndQualityRating";

import {
  checkIsManagementMember,
  getAllCategoryComment,
  getAllCategoryProsCons,
  getListCriteriaInEvaluationsOfUser,
  insertEvaluationDetailsPersonal
} from "~/apis";
import { calculateTotalAssessmentValue } from "~/utils/calculateTotalAssessmentValue";
import { calculateTotalAssessmentValueDynamic } from "~/utils/calculateTotalAssessmentValueDynamic";
import { getTotalAssessmentValueSupervisorDynamic } from "~/utils/getTotalAssessmentValueSupervisorDynamic";
import { openNotificationTopLeft } from "~/utils/openNotification";

const EvaluationDetailsUser = (props) => {
  const { isOpen, setIsOpen, evaluationId, status, refetchApi } = props;
  const { Text } = Typography;
  const typingTimeoutRef = useRef(null);
  const advantageRef = useRef(null);

  const [data, setData] = useState([]);
  const [dataProsCons, setDataProsCons] = useState([]);
  const [dataSupervisors, setDataSupervisors] = useState([]);
  const [userIds, setUserIds] = useState([]);
  const [loading, setLoading] = useState(false);
  const [file, setFile] = useState(null);
  const [activeTabKey, setActiveTabKey] = useState("1");
  const [openSendEvaluation, setOpenSendEvaluation] = useState(false);
  const [bindingAdvantage, setBindingAdvantage] = useState("");
  const [bindingDisAdvantage, setBindingDisAdvantage] = useState("");
  const [bindingAddReview, setBindingAddReview] = useState("");
  const [suggestions, setSuggestions] = useState([]);
  const [isSuggestAdvantageOpen, setIsSuggestAdvantageOpen] = useState(false);
  const [isSuggestDisAdvantageOpen, setIsSuggestDisAdvantageOpen] = useState(false);
  const [selectedAdvantages, setSelectedAdvantages] = useState("");
  const [selectedDisadvantages, setSelectedDisadvantages] = useState("");
  const [bindingKetQuaHoatDongCoQuan, setBindingKetQuaHoatDongCoQuan] = useState("");
  const [bindingNangLucLanhDaoQuanLy, setBindingNangLucLanhDaoQuanLy] = useState("");
  const [bindingNangLucTapHopDoanKet, setBindingNangLucTapHopDoanKet] = useState("");
  const [isPrincipal, setIsPrincipal] = useState(false);
  const [isOpenNewAndUpdateEvaluationExplaint, setIsOpenNewAndUpdateEvaluationExplaint] = useState(false);
  const [isOpenEvaluationDetailsUserPrint, setIsOpenEvaluationDetailsUserPrint] = useState(false);
  const [nameCriteriaDisplay, setNameCriteriaDisplay] = useState("");
  const [explaintCategoryCriteriaId, setExplaintCategoryCriteriaId] = useState(null);

  const fetchApiGetAll = async (evaluationId) => {
    setLoading(true);
    try {
      const [data1, data2, data3, data4] = await Promise.all([
        getListCriteriaInEvaluationsOfUser(evaluationId),
        getAllCategoryProsCons(),
        getAllCategoryComment(),
        checkIsManagementMember()
      ]);
      setData(data1.data.criteriaList);
      if (data1.data.supervisorList !== null) {
        setDataSupervisors(data1.data.supervisorList);
        setUserIds(data1.data.supervisorList.map((supervisor) => supervisor.userId));
      }
      setDataProsCons(data2.dataList);
      setBindingAddReview(getReview(data3.dataList));
      if (data4.data !== null) {
        setIsPrincipal(true);
      }
    } catch (error) {
      console.error("Error fetching data:", error);
      openNotificationTopLeft("error", "Thông báo lỗi!", error);
    } finally {
      setLoading(false);
    }
  };

  const calculateTotalEndValue = (children) => {
    let total = 0;

    children.forEach((child) => {
      if (child.children && child.children.length > 0) {
        if (child.isDistinct) {
          // Khi isDistinct = true, tính giá trị endValue lớn nhất trong các phần tử con
          const maxEndValue = child.children.reduce((maxValue, currentItem) => {
            const currentEndValue = currentItem.endValue ?? 0;
            return currentEndValue > maxValue ? currentEndValue : maxValue;
          }, 0);

          // Thêm giá trị endValue lớn nhất vào tổng
          total += maxEndValue;
        } else {
          // Khi isDistinct = false, tính tổng endValue của tất cả các children
          total += calculateTotalEndValue(child.children);
        }
      } else {
        // Nếu không có children, thêm endValue của child vào tổng
        total += child.endValue ?? 0;
      }
    });

    return total;
  };

  const getTotalAssessmentValue = (data) => {
    let total = 0;
    data.forEach((item) => {
      if (item.children && item.children.length > 0) {
        total += calculateTotalAssessmentValue(item.children);
      } else {
        total += item.assessmentValue || item.startValue;
      }
    });
    return total;
  };

  const checkDistinct = (arr, id) => {
    for (const item of arr) {
      if (item.id === id) {
        return item.isDistinct;
      }
      if (item.children) {
        const found = checkDistinct(item.children, id);
        if (found) {
          return found;
        }
      }
    }
    return null;
  };

  const resetChildrenAssessment = (children) => {
    return children.map((child) => ({
      ...child,
      assessmentValue: 0,
      children: child.children?.length ? resetChildrenAssessment(child.children) : []
    }));
  };

  const resetOtherAssessments = (data, parentIdToReset, evaluationCriteriaId) => {
    return data.map((item) => {
      if (item.parentId === parentIdToReset && item.evaluationCriteriaId !== evaluationCriteriaId) {
        return {
          ...item,
          assessmentValue: 0,
          children: item.children?.length
            ? resetOtherAssessments(item.children, parentIdToReset, evaluationCriteriaId)
            : []
        };
      }
      if (item.children?.length) {
        return { ...item, children: resetOtherAssessments(item.children, parentIdToReset, evaluationCriteriaId) };
      }
      return item;
    });
  };

  const updateData = (data, evaluationCriteriaId, parentId, isDistinct, value) => {
    return data.map((item) => {
      if (item.evaluationCriteriaId === evaluationCriteriaId) {
        return { ...item, assessmentValue: value || 0 };
      }

      if (item.idParent === parentId && isDistinct) {
        return {
          ...item,
          assessmentValue: 0,
          children: item.children?.length ? resetChildrenAssessment(item.children) : []
        };
      }

      if (item.children?.length) {
        return { ...item, children: updateData(item.children, evaluationCriteriaId, parentId, isDistinct, value) };
      }

      return item;
    });
  };

  const handleInputChange = (value, evaluationCriteriaId, parentId) => {
    const listCategoryCriteria = [...data]; // Create a shallow copy of the data

    const isDistinct = checkDistinct(listCategoryCriteria, parentId);

    // Determine the parentId of the item being changed
    const parentIdToReset = data.find((item) => item.evaluationCriteriaId === evaluationCriteriaId)?.parentId || null;

    // Update the data and reset other assessments
    const updatedData = updateData(
      resetOtherAssessments(listCategoryCriteria, parentIdToReset, evaluationCriteriaId),
      evaluationCriteriaId,
      parentId,
      isDistinct,
      value
    );

    // Update the state with the new data
    setData(updatedData);
  };

  const getGradingName = (score) => {
    if (score >= 90) return { name: "HTXSNV", color: "green" };
    if (score >= 70) return { name: "HTTNV", color: "blue" };
    if (score >= 60) return { name: "HTNV", color: "yellow" };
    return { name: "KHTNV", color: "red" };
  };

  const getSuggestions = (inputValue, type) => {
    const allSuggestions = dataProsCons?.filter((item) => item.isPros === (type === "advantages" ? true : false)) || [];
    return allSuggestions
      .filter((item) => item.content && item.content.toLowerCase().includes(inputValue.toLowerCase()))
      .map((item) => ({
        value: item.content || "",
        label: item.content || ""
      }));
  };

  const handleSuggestionDisplay = (e, type) => {
    const inputValue = e.target.value;
    const listLine = inputValue.split("\n").filter((x) => x !== "");
    const filterSuggestion = listLine.length > 0 ? listLine[listLine.length - 1] : inputValue;

    if (typingTimeoutRef.current) {
      clearTimeout(typingTimeoutRef.current);
    }

    typingTimeoutRef.current = setTimeout(() => {
      if (type === "advantages") {
        setSelectedAdvantages(inputValue);
        const newSuggestions = getSuggestions(filterSuggestion.trim().replace("-", ""), type);
        if (newSuggestions.length > 0) {
          setSuggestions(newSuggestions);
          setIsSuggestAdvantageOpen(true);
          setIsSuggestDisAdvantageOpen(false);
        } else {
          setIsSuggestAdvantageOpen(false);
          setIsSuggestDisAdvantageOpen(false);
        }
      } else {
        setSelectedDisadvantages(inputValue);
        const newSuggestions = getSuggestions(filterSuggestion.trim().replace("-", ""), type);
        setSuggestions(newSuggestions);
        setIsSuggestDisAdvantageOpen(newSuggestions.length > 0);
        setIsSuggestAdvantageOpen(false);
      }
    }, 500);
  };

  const handleSelectSuggestion = (option, type) => {
    if (type === "advantages") {
      setSelectedAdvantages((prev) => {
        const listLine = prev
          .split("\n")
          .filter((x) => x !== "")
          .slice(0, -1);
        const newValue = listLine.length > 0 ? `${listLine.join("\n")}\n - ${option.label}\n` : ` - ${option.label}\n`;
        return newValue;
      });
      setIsSuggestAdvantageOpen(false);
    } else {
      setSelectedDisadvantages((prev) => {
        const listLine = prev
          .split("\n")
          .filter((x) => x !== "")
          .slice(0, -1);
        const newValue = listLine.length > 0 ? `${listLine.join("\n")}\n - ${option.label}\n` : ` - ${option.label}\n`;
        return newValue;
      });
      setIsSuggestDisAdvantageOpen(false);
    }
  };

  const getValues = (data) => {
    const values = [];
    const collectValues = (items) => {
      items.forEach((item) => {
        if (!item.children || item.children.length === 0) {
          if (item.assessmentValue !== undefined) {
            values.push({
              id: item.id,
              evaluationCriteriaId: item.evaluationCriteriaId,
              assessmentValue: item.assessmentValue ?? 0
            });
          }
        } else {
          collectValues(item.children);
        }
      });
    };
    collectValues(data);
    return values;
  };

  const getReview = (dataReview) => {
    const combinedReviews = dataReview.map((item) => {
      const sortTitle = item.sort + ". " + item.title || "";
      const content = item.content || "";
      return `${sortTitle}\n${content}`;
    });
    return combinedReviews.join("\n");
  };

  const items = [
    {
      key: "1",
      label: `KẾT QUẢ TỰ ĐÁNH GIÁ`,
      children: <SelfEvaluationResults bindingAddReview={bindingAddReview} setBindingAddReview={setBindingAddReview} />
    },
    {
      key: "2",
      label: `TỰ NHẬN XÉT, XẾP LOẠI CHẤT LƯỢNG`,
      children: (
        <SelfReviewAndQualityRating
          suggestions={suggestions}
          advantageRef={advantageRef}
          bindingDisAdvantage={bindingDisAdvantage}
          bindingAdvantage={bindingAdvantage}
          selectedDisadvantages={selectedDisadvantages}
          selectedAdvantages={selectedAdvantages}
          isSuggestDisAdvantageOpen={isSuggestDisAdvantageOpen}
          isSuggestAdvantageOpen={isSuggestAdvantageOpen}
          handleTextAreaChange={handleSuggestionDisplay}
          handleSelectSuggestion={handleSelectSuggestion}
        />
      )
    },
    {
      key: "3",
      label: `PHẦN DÀNH RIÊNG CHO VIÊN CHỨC QUẢN LÝ`,
      children: (
        <ManagerExclusiveSection
          bindingKetQuaHoatDongCoQuan={bindingKetQuaHoatDongCoQuan}
          setBindingKetQuaHoatDongCoQuan={setBindingKetQuaHoatDongCoQuan}
          bindingNangLucLanhDaoQuanLy={bindingNangLucLanhDaoQuanLy}
          setBindingNangLucLanhDaoQuanLy={setBindingNangLucLanhDaoQuanLy}
          bindingNangLucTapHopDoanKet={bindingNangLucTapHopDoanKet}
          setBindingNangLucTapHopDoanKet={setBindingNangLucTapHopDoanKet}
        />
      ),
      disabled: !isPrincipal
    },
    {
      key: "4",
      label: `XÁC NHẬN GỬI ĐÁNH GIÁ`,
      children: <EvaluationSubmissionConfirmation setFile={setFile} />
    }
  ];

  const columns = [
    {
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>STT</div>,
      dataIndex: "stt",
      key: "stt",
      width: 80,
      render: (text) => (
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            height: "100%",
            width: "100%"
          }}
        >
          <Text
            style={{
              width: "100%",
              textAlign: "center",
              height: 40,
              fontSize: 17,
              display: "flex",
              alignItems: "center",
              justifyContent: "center"
            }}
          >
            {text}
          </Text>
        </div>
      )
    },
    {
      title: <div style={{ fontSize: 17, fontWeight: "bold" }}>Tiêu chí</div>,
      dataIndex: "criteriaName",
      key: "criteriaName",
      align: "left",
      render: (text, record) => (
        <div
          style={{
            whiteSpace: "break-spaces",
            fontWeight: record.children?.length > 0 ? "bold" : "normal",
            fontSize: record.children?.length > 0 ? 17 : 16
          }}
        >
          {text}
        </div>
      )
    },
    {
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>Điểm tối đa</div>,
      dataIndex: "endValue",
      key: "endValue",
      width: 200,
      render: (endValue, record) => {
        const total = record.isDistinct ? record.endValue || 0 : calculateTotalEndValue(record.children);
        return (
          <div style={{ whiteSpace: "break-spaces" }}>
            <Tag
              style={{
                width: "100%",
                textAlign: "center",
                height: 40,
                fontSize: 16,
                fontWeight: record.children?.length > 0 ? "bold" : "normal",
                alignContent: "center"
              }}
            >
              {record.children?.length > 0 ? total : endValue}
            </Tag>
          </div>
        );
      }
    },
    {
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>Điểm tự đánh giá</div>,
      dataIndex: "assessmentValue",
      key: "assessmentValue",
      width: 200,
      render: (assessmentValue, record) => {
        const total = calculateTotalAssessmentValue(record.children);
        return record.children?.length > 0 ? (
          <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
            <Tag
              style={{
                width: "100%",
                textAlign: "center",
                height: 40,
                fontSize: 16,
                fontWeight: "bold",
                alignContent: "center"
              }}
            >
              {total}
            </Tag>
          </div>
        ) : (status ?? 0) >= 2 ? (
          <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
            <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 16, alignContent: "center" }}>
              {record.assessmentValue}
            </Tag>
          </div>
        ) : (
          <Input
            type="number"
            value={record.assessmentValue ?? record.startValue}
            min={record.startValue}
            max={record.endValue}
            onChange={(e) => {
              let value = parseInt(e.target.value.replace(/[^0-9]/g, ""), 10) || 0;
              if (value > record.endValue) {
                value = record.endValue;
              } else if (value < 0) {
                value = 0;
              }
              handleInputChange(value, record.evaluationCriteriaId, record.parentId);
            }}
            style={{
              color: "blue",
              width: "100%",
              height: 40,
              justifyContent: "center",
              alignItems: "center",
              display: "inline-flex",
              textAlign: "left",
              fontSize: 16
            }}
          />
        );
      }
    },
    ...(status === 2
      ? dataSupervisors.map((item, index) => ({
          title: <div style={{ fontSize: 16, fontWeight: "bold" }}>{item.fullName}</div>,
          dataIndex: `assessmentValue_${item.userId}`,
          key: `assessmentValue_${item.userId}`,
          width: 150,
          render: (assessmentValue, record) => {
            const total = calculateTotalAssessmentValueDynamic(record.children, index);
            return record.children?.length > 0 ? (
              <Tag
                style={{
                  width: "100%",
                  textAlign: "center",
                  height: 40,
                  fontSize: 16,
                  fontWeight: "bold",
                  alignContent: "center"
                }}
              >
                {total}
              </Tag>
            ) : (
              <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 16, alignContent: "center" }}>
                {record.supervisorEvaluations[index]?.assessmentValueSupervisor}
              </Tag>
            );
          }
        }))
      : [null]),
    {
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>Giải trình</div>,
      dataIndex: "id",
      key: "id",
      width: 80,
      render: (id, record) => (
        <Button
          icon={status === 2 ? <EditOutlined /> : <SaveOutlined />}
          style={{ fontSize: 14, width: 170, height: 40, color: "white", backgroundColor: "#1890ff" }}
          onClick={() => {
            setNameCriteriaDisplay(record.stt + ". " + record.criteriaName);
            setExplaintCategoryCriteriaId(record.id);
            setIsOpenNewAndUpdateEvaluationExplaint(true);
          }}
        >
          {status === 2 ? "Xem lại giải trình" : "Thêm giải trình"}
        </Button>
      )
    }
  ];

  const propsTable = {
    scroll: {
      x: 800
    },
    bordered: true,
    rowKey: (record) => record.id,
    columns: columns.map((item) => ({
      align: "center",
      ...item
    })),
    loading: loading,
    dataSource: data,
    expandedRowKeys: data?.flatMap((item) => {
      const keys = [item.id];
      if (item.children) {
        keys.push(...item.children.map((child) => child.id));
      }
      return keys;
    }),
    pagination: false,
    expandable: {
      defaultExpandAllRows: true,
      expandIcon: () => null
    },
    size: "middle",
    summary: () => (
      <>
        <Table.Summary.Row style={{ height: 40 }}>
          <Table.Summary.Cell index={0} colSpan={2}>
            <div style={{ fontWeight: "bold", textAlign: "right", fontSize: 16 }}>Tổng điểm:</div>
          </Table.Summary.Cell>
          <Table.Summary.Cell index={1} colSpan={1}>
            <Tag
              color="green"
              style={{
                width: "100%",
                textAlign: "center",
                height: 40,
                fontSize: 16,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontWeight: "bold"
              }}
            >
              {calculateTotalEndValue(data)}
            </Tag>
          </Table.Summary.Cell>
          <Table.Summary.Cell index={2} colSpan={1}>
            <Tag
              color="green"
              style={{
                width: "100%",
                textAlign: "center",
                height: 40,
                fontSize: 16,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontWeight: "bold"
              }}
            >
              {getTotalAssessmentValue(data)}
            </Tag>
          </Table.Summary.Cell>
          {status === 2
            ? dataSupervisors.map((item, index) => {
                const total = getTotalAssessmentValueSupervisorDynamic(data, index);
                return (
                  <Table.Summary.Cell key={index} index={3 + index} colSpan={1}>
                    <Tag
                      color="green"
                      style={{
                        width: "100%",
                        textAlign: "center",
                        height: 40,
                        fontSize: 16,
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        fontWeight: "bold"
                      }}
                    >
                      {total}
                    </Tag>
                  </Table.Summary.Cell>
                );
              })
            : null}
        </Table.Summary.Row>
        <Table.Summary.Row style={{ height: 40 }}>
          <Table.Summary.Cell index={0} colSpan={2}>
            <div style={{ fontWeight: "bold", textAlign: "right", fontSize: 16 }}>Xếp loại: </div>
          </Table.Summary.Cell>
          <Table.Summary.Cell index={0} colSpan={2}>
            <Tag
              color={getGradingName(getTotalAssessmentValue(data)).color}
              style={{
                width: "100%",
                textAlign: "center",
                height: 40,
                fontSize: 16,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontWeight: "bold"
              }}
            >
              {getGradingName(getTotalAssessmentValue(data)).name}
            </Tag>
          </Table.Summary.Cell>
          {status === 2
            ? dataSupervisors.map((item, index) => {
                const total = getTotalAssessmentValueSupervisorDynamic(data, index);
                return (
                  <Table.Summary.Cell key={index} index={3 + index} colSpan={1}>
                    <Tag
                      color={getGradingName((total / calculateTotalEndValue(data)) * 100).color}
                      style={{
                        width: "100%",
                        textAlign: "center",
                        height: 40,
                        fontSize: 16,
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        fontWeight: "bold"
                      }}
                    >
                      {getGradingName((total / calculateTotalEndValue(data)) * 100).name}
                    </Tag>
                  </Table.Summary.Cell>
                );
              })
            : null}
        </Table.Summary.Row>
      </>
    )
  };

  const onFinish = async (isSave) => {
    setLoading(true);
    const values = getValues(data);
    let formattedValues = {};
    if (!isSave) {
      if (!selectedAdvantages || !selectedDisadvantages) {
        setLoading(false);
        openNotificationTopLeft("warning", "Cảnh báo", "Vui lòng điền đầy đủ thông tin ưu, nhược điểm!");
        return;
      } else if (!bindingAddReview) {
        setLoading(false);
        openNotificationTopLeft("warning", "Cảnh báo", "Vui lòng điền đầy đủ thông tin kết quả tự nhận xét đánh giá!");
        return;
      } else if (
        isPrincipal === true &&
        (!bindingKetQuaHoatDongCoQuan || !bindingNangLucLanhDaoQuanLy || !bindingNangLucTapHopDoanKet)
      ) {
        setLoading(false);
        openNotificationTopLeft(
          "warning",
          "Cảnh báo",
          "Vui lòng điền đầy đủ thông tin Phần dành riêng cho Viên chức quản lý!"
        );
        return;
      }

      if (file === null && !isSave) {
        setLoading(false);
        openNotificationTopLeft("warning", "Cảnh báo", "Vui lòng chọn tệp chữ ký số!");
        return;
      }

      formattedValues = {
        evaluationId: evaluationId,
        evaluationStatus: 2,
        userCriteriaEvaluations: values,
        evaluationDetails: {
          advantages: selectedAdvantages,
          disAdvantages: selectedDisadvantages,
          addReviews: bindingAddReview,
          ketQuaHoatDongCoQuan: bindingKetQuaHoatDongCoQuan,
          nangLucLanhDaoQuanLy: bindingNangLucLanhDaoQuanLy,
          nangLucTapHopDoanKet: bindingNangLucTapHopDoanKet
        }
      };
    } else {
      formattedValues = {
        evaluationId: evaluationId,
        evaluationStatus: 1,
        userCriteriaEvaluations: values,
        evaluationDetails: {
          advantages: null,
          disAdvantages: null,
          addReviews: null,
          ketQuaHoatDongCoQuan: null,
          nangLucLanhDaoQuanLy: null,
          nangLucTapHopDoanKet: null
        }
      };
    }

    const res = await insertEvaluationDetailsPersonal(formattedValues, file);

    if (res.isSuccess) {
      refetchApi();
      setIsOpen(false);
      setOpenSendEvaluation(false);
      setIsOpenNewAndUpdateEvaluationExplaint(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    if (evaluationId) {
      fetchApiGetAll(evaluationId);
    }
  }, [evaluationId]);

  return (
    <>
      <Modal
        title={
          <Typography.Title level={5} style={{ marginBottom: 10 }}>
            Thực hiện Gửi đánh giá
          </Typography.Title>
        }
        okText="Xác nhận gửi đánh giá"
        cancelText={"Hủy đánh giá"}
        width={1200}
        confirmLoading={loading}
        open={openSendEvaluation}
        onOk={
          activeTabKey === "4"
            ? () => {
                onFinish(0);
              }
            : () => {}
        }
        onCancel={() => {
          setActiveTabKey("1");
          setOpenSendEvaluation(false);
        }}
        footer={activeTabKey === "4" ? undefined : null}
        style={{
          top: 20
        }}
      >
        <Tabs activeKey={activeTabKey} onChange={setActiveTabKey} items={items} />
      </Modal>

      <Modal
        title={
          <Typography.Title level={5} style={{ marginBottom: 10, padding: 10 }}>
            {nameCriteriaDisplay}
          </Typography.Title>
        }
        width={1200}
        confirmLoading={loading}
        open={isOpenNewAndUpdateEvaluationExplaint}
        onCancel={() => {
          setIsOpenNewAndUpdateEvaluationExplaint(false);
        }}
        style={{
          top: 20
        }}
        footer={null}
      >
        <NewAndUpdateEvaluationExplaint
          closeModal={setIsOpenNewAndUpdateEvaluationExplaint}
          categoryCriteriaId={explaintCategoryCriteriaId}
          evaluationId={evaluationId}
          userIds={userIds}
          type={1}
        />
      </Modal>

      <Modal
        title={
          <Typography.Title level={5} style={{ marginBottom: 10, paddingTop: 10, paddingBottom: 10 }}>
            Danh sách các mẫu in
          </Typography.Title>
        }
        width={600}
        confirmLoading={loading}
        open={isOpenEvaluationDetailsUserPrint}
        onCancel={() => {
          setIsOpenEvaluationDetailsUserPrint(false);
        }}
        style={{
          top: 20
        }}
        footer={null}
      >
        <EvaluationDetailsUserPrint
          closeModal={setIsOpenEvaluationDetailsUserPrint}
          // categoryCriteriaId={explaintCategoryCriteriaId}
          evaluationId={evaluationId}
          // userIds={userIds}
        />
      </Modal>

      <Drawer
        onClose={() => {
          setIsOpen(false);
        }}
        open={isOpen}
        styles={{ header: { height: 60, backgroundColor: "#1890ff" } }}
        closeIcon={false}
        placement="right"
        width="100%"
        height="100%"
        title={
          <Row
            justify="space-between"
            style={{
              alignItems: "center",
              alignContent: "center"
            }}
          >
            <Col>
              <Text
                style={{
                  fontSize: 18,
                  color: "white"
                }}
              >
                Thực hiện đánh giá
              </Text>
            </Col>
            <Col>
              <CloseOutlined style={{ fontSize: 20 }} onClick={() => setIsOpen(false)} />
            </Col>
          </Row>
        }
        footer={
          <Space
            style={{
              width: "100%",
              height: 50,
              justifyContent: "flex-end"
            }}
          >
            <Button
              loading={loading}
              onClick={() => {
                setIsOpenEvaluationDetailsUserPrint(true);
              }}
              icon={<SaveOutlined />}
              style={{ fontSize: 14, width: 130, height: 40, color: "white", backgroundColor: "#1890ff" }}
            >
              Mẫu in ấn
            </Button>

            <Button
              hidden={status === 2 ? true : false}
              loading={loading}
              onClick={() => {
                setOpenSendEvaluation(true);
              }}
              icon={<SendOutlined />}
              style={{
                fontSize: 14,
                width: 150,
                height: 40,
                color: "white",
                backgroundColor: "#1890ff",
                background: "blueviolet",
                borderColor: "1890ff"
              }}
            >
              Gửi đánh giá
            </Button>
            <Button
              hidden={status === 2 ? true : false}
              loading={loading}
              onClick={() => {
                onFinish(1);
              }}
              icon={<SaveOutlined />}
              style={{ fontSize: 14, width: 130, height: 40, color: "white", backgroundColor: "#ff1346" }}
            >
              Lưu lại
            </Button>

            <Button
              loading={loading}
              onClick={() => setIsOpen(false)}
              icon={<CloseOutlined />}
              style={{
                fontSize: 14,
                width: 100,
                height: 40,
                color: "white",
                backgroundColor: "#1890ff",
                background: "cornflowerblue",
                borderColor: "1890ff"
              }}
            >
              Đóng
            </Button>
          </Space>
        }
        loading={loading}
      >
        <Table {...propsTable} />
      </Drawer>
    </>
  );
};

export default EvaluationDetailsUser;
