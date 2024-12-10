import { useEffect, useRef, useState } from "react";
import { CloseOutlined, EditOutlined, SaveOutlined, SendOutlined } from "@ant-design/icons";
import { Button, Col, Drawer, Input, Modal, Row, Space, Table, Tabs, Tag, Typography } from "antd";

import EvaluationDetailsUserPrint from "./EvaluationDetailsUserComponents/EvaluationDetailsUserPrint";
import EvaluationSubmissionConfirmation from "./EvaluationDetailsUserComponents/EvaluationSubmissionConfirmation";
import ManagerExclusiveSection from "./EvaluationDetailsUserComponents/ManagerExclusiveSection";
import NewAndUpdateEvaluationExplaint from "./EvaluationDetailsUserComponents/NewAndUpdateEvaluationExplaint";
import SelfEvaluationResults from "./EvaluationDetailsUserComponents/SelfEvaluationResults";
import SelfReviewAndQualityRating from "./EvaluationDetailsUserComponents/SelfReviewAndQualityRating";
import WordViewer from "./WordViewer";

import {
  checkIsManagementMember,
  getAllCategoryComment,
  getAllCategoryProsCons,
  getListCriteriaInEvaluationsOfUserCustom,
  insertEvaluationDetailsPersonal
} from "~/apis";
import { calculateTotalAssessmentValue } from "~/utils/calculateTotalAssessmentValue";
import { getGradingName } from "~/utils/getGradingName";
import { openNotificationTopLeft } from "~/utils/openNotification";

const EvaluationDetailsUserCustom = (props) => {
  const { isOpen, setIsOpen, evaluationId, status, refetchApi } = props;
  const { Text } = Typography;

  const typingTimeoutRef = useRef(null);
  const advantageRef = useRef(null);
  const [loading, setLoading] = useState(false);
  const [criteriaData, setCriteriaData] = useState([]);
  const [supervisors, setSupervisors] = useState([]);
  const [dataProsCons, setDataProsCons] = useState([]);
  const [isPrincipal, setIsPrincipal] = useState(false);
  const [bindingAddReview, setBindingAddReview] = useState("");
  const [userIds, setUserIds] = useState([]);
  const [file, setFile] = useState(null);
  const [activeTabKey, setActiveTabKey] = useState("1");
  const [openSendEvaluation, setOpenSendEvaluation] = useState(false);
  const [bindingAdvantage, setBindingAdvantage] = useState("");
  const [bindingDisAdvantage, setBindingDisAdvantage] = useState("");
  const [suggestions, setSuggestions] = useState([]);
  const [isSuggestAdvantageOpen, setIsSuggestAdvantageOpen] = useState(false);
  const [isSuggestDisAdvantageOpen, setIsSuggestDisAdvantageOpen] = useState(false);
  const [selectedAdvantages, setSelectedAdvantages] = useState("");
  const [selectedDisadvantages, setSelectedDisadvantages] = useState("");
  const [bindingKetQuaHoatDongCoQuan, setBindingKetQuaHoatDongCoQuan] = useState("");
  const [bindingNangLucLanhDaoQuanLy, setBindingNangLucLanhDaoQuanLy] = useState("");
  const [bindingNangLucTapHopDoanKet, setBindingNangLucTapHopDoanKet] = useState("");
  const [isOpenNewAndUpdateEvaluationExplaint, setIsOpenNewAndUpdateEvaluationExplaint] = useState(false);
  const [isOpenEvaluationDetailsUserPrint, setIsOpenEvaluationDetailsUserPrint] = useState(false);
  const [nameCriteriaDisplay, setNameCriteriaDisplay] = useState("");
  const [explaintCategoryCriteriaId, setExplaintCategoryCriteriaId] = useState(null);
  const [isOpenn, setIsOpenn] = useState(false);
  const fetchApiGetAll = async (evaluationId) => {
    setLoading(true);
    try {
      const [data1, data2, data3, data4] = await Promise.all([
        getListCriteriaInEvaluationsOfUserCustom(evaluationId),
        getAllCategoryProsCons(),
        getAllCategoryComment(),
        checkIsManagementMember()
      ]);
      setCriteriaData(data1.data.criteriaData);
      setSupervisors(data1.data.criteriaData[0].assessmentResults);
      setUserIds(data1.data.criteriaData[0].assessmentResults.map((supervisor) => supervisor.userId));
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

  // Hàm tính tổng điểm của tiêu chí cha
  const calculateTotal = (record, field, supervisorIndex) => {
    if (!record.children || record.children.length === 0) {
      if (field === "supervisors") {
        return record.assessmentResults[supervisorIndex]?.score || 0;
      }
      return record[field];
    }
    return record.children.reduce(
      (total, child) => total + calculateTotal(child, field, field === "supervisors" ? supervisorIndex : undefined),
      0
    );
  };

  const calculateTotalAssessmentValueSupervisor = (children, index) => {
    let total = 0;
    children.forEach((child) => {
      if (child.children && child.children.length > 0) {
        total += calculateTotalAssessmentValueSupervisor(child.children, index);
      } else {
        total += child.assessmentResults[index].score || 0;
      }
    });
    return total;
  };

  // Hàm cập nhật điểm
  const handleInputChange = (id, field, value, supervisorIndex) => {
    const updateData = (data) =>
      data.map((item) => {
        if (item.id === id) {
          if (field === "supervisors") {
            const updatedSupervisors = [...item.assessmentResults];
            updatedSupervisors[supervisorIndex].score = parseFloat(value) || 0;
            return { ...item, supervisors: updatedSupervisors };
          }
          return { ...item, [field]: parseInt(value) || 0 };
        }
        if (item.children) {
          return { ...item, children: updateData(item.children) };
        }
        return item;
      });

    setCriteriaData(updateData(criteriaData));
  };

  // Hàm làm phẳng và lấy những phần tử không có tiêu chí con
  const flattenCriteriaData = (data) => {
    let flatData = []; // Khởi tạo một mảng mới để lưu trữ dữ liệu không có tiêu chí con.

    // Duyệt qua tất cả các phần tử trong mảng data
    for (let i = 0; i < data.length; i++) {
      const item = data[i]; // Lấy phần tử hiện tại trong mảng.

      // Log ra phần tử hiện tại
      // console.log("Đang xử lý phần tử:", item);

      // Kiểm tra xem phần tử có tiêu chí con hay không
      if (!item.children || item.children.length === 0) {
        // Nếu không có con, thêm phần tử vào mảng flatData
        // console.log("Phần tử không có con, thêm vào flatData:", item);
        flatData.push({
          id: item.id,
          evaluationCriteriaId: item.evaluationCriteriaId,
          assessmentValue: item.assessmentValue
        });
      }

      // Nếu phần tử có con, gọi đệ quy để làm phẳng các phần tử con
      if (item.children && item.children.length > 0) {
        // console.log("Phần tử có con, gọi đệ quy cho children:", item.children);

        const childrenFlattened = flattenCriteriaData(item.children); // Gọi đệ quy để làm phẳng các phần tử con.

        // Log kết quả đệ quy cho children
        // console.log("Kết quả làm phẳng cho children:", childrenFlattened);

        // Nối các phần tử con đã làm phẳng vào mảng flatData mà không dùng concat
        for (let j = 0; j < childrenFlattened.length; j++) {
          // console.log("Thêm phần tử vào flatData:", childrenFlattened[j]);
          flatData.push(childrenFlattened[j]);
        }
      }
    }

    // Log kết quả sau khi xử lý xong
    // console.log("Kết quả cuối cùng của flatData:", flatData);

    return flatData; // Trả về mảng đã làm phẳng
  };

  const calculateTotalEndValue = (children) => {
    let total = 0;
    children.forEach((child) => {
      if (child.children && child.children.length > 0) {
        total += calculateTotalEndValue(child.children);
      } else {
        total += child.endValue ?? 0;
      }
    });
    return total;
  };

  const getReview = (dataReview) => {
    const combinedReviews = dataReview.map((item) => {
      const sortTitle = item.sort + ". " + item.title || "";
      const content = item.content || "";
      return `${sortTitle}\n${content}`;
    });
    return combinedReviews.join("\n");
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

  const onFinish = async (isSave) => {
    setLoading(true);

    const values = flattenCriteriaData(criteriaData);

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

  // Tạo cột cho Supervisor
  const supervisorColumns = supervisors.map((supervisor, index) => ({
    title: (
      <>
        <div>{supervisor.fullName}</div>
        <div style={{ fontSize: "12px", color: "gray" }}>{supervisor.userTypeName}</div>
      </>
    ),
    key: `supervisor${index + 1}Score`,
    align: "center",
    width: 150,
    render: (_, record) =>
      record.children && record.children.length > 0 ? (
        <Tag
          style={{
            width: "100%",
            textAlign: "center",
            height: 40,
            fontSize: 15,
            fontWeight: "bold",
            alignContent: "center"
          }}
        >
          {calculateTotal(record, "supervisors", index)}
        </Tag>
      ) : (
        <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 15, alignContent: "center" }}>
          {record.assessmentResults[index]?.score || 0}
        </Tag>
      )
  }));

  // Cấu hình các cột
  const columns = [
    {
      title: <div style={{ fontSize: 16 }}>STT</div>,
      dataIndex: "stt",
      key: "stt",
      width: 80,
      align: "center",
      render: (text, record) => (
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            height: "100%",
            fontWeight: record.children?.length > 0 ? "bold" : "normal",

            width: "100%"
          }}
        >
          {text}
        </div>
      )
    },
    {
      title: <div style={{ fontSize: 16 }}>Tiêu chí đánh giá</div>,
      dataIndex: "criteriaName",
      key: "criteriaName",
      align: "left",
      render: (text, record) => (
        <div
          style={{
            whiteSpace: "break-spaces",
            fontWeight: record.children?.length > 0 ? "bold" : "normal",
            fontSize: record.children?.length > 0 ? 16 : 15
          }}
        >
          {text}
        </div>
      )
    },
    {
      title: <div style={{ fontSize: 14 }}>Điểm chuẩn</div>,
      dataIndex: "endValue",
      key: "endValue",
      width: 150,
      render: (endValue, record) => (
        <Tag
          style={{
            width: "100%",
            textAlign: "center",
            height: 40,
            fontSize: 15,
            fontWeight: record.children?.length > 0 ? "bold" : "normal",
            alignContent: "center"
          }}
        >
          {endValue}
        </Tag>
      )
    },
    {
      title: <div style={{ fontSize: 14 }}>Điểm tự đánh giá</div>,
      key: "assessmentValue",
      width: 150,
      render: (_, record) =>
        record.children && record.children.length > 0 ? (
          <Tag
            style={{
              width: "100%",
              textAlign: "center",
              height: 40,
              fontSize: 15,
              fontWeight: "bold",
              alignContent: "center"
            }}
          >
            {calculateTotal(record, "assessmentValue")}
          </Tag>
        ) : status >= 2 ? (
          <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
            <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 15, alignContent: "center" }}>
              {record.assessmentValue}
            </Tag>
          </div>
        ) : (
          <Input
            type="number"
            value={record.assessmentValue}
            min={0}
            max={record.endValue}
            onChange={(e) => {
              let inputValue = e.target.value.trim();
              let parsedValue = parseInt(inputValue, 10);

              // Xử lý giá trị nhập vào:
              if (isNaN(parsedValue) || parsedValue < 0) {
                parsedValue = 0;
              } else if (parsedValue > record.endValue) {
                parsedValue = record.endValue;
              }

              handleInputChange(record.id, "assessmentValue", parsedValue);
            }}
            style={{
              color: "blue",
              width: "100%",
              height: 40,
              justifyContent: "center",
              alignItems: "center",
              display: "inline-flex",
              textAlign: "left",
              fontSize: 15
            }}
          />
        )
    },
    ...supervisorColumns,
    {
      title: <div style={{ fontSize: 14 }}>Giải trình</div>,
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
    rowKey: (record) => record.id,
    loading: loading,
    columns: columns.map((item) => ({
      align: "center",
      ...item
    })),
    bordered: true,
    expandable: {
      defaultExpandAllRows: true,
      expandIcon: () => null
    },
    dataSource: criteriaData,
    pagination: false,
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
              {calculateTotalEndValue(criteriaData)}
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
              {calculateTotalAssessmentValue(criteriaData)}
            </Tag>
          </Table.Summary.Cell>
          {supervisors.map((item, index) => {
            const total = calculateTotalAssessmentValueSupervisor(criteriaData, index);
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
          })}
        </Table.Summary.Row>

        <Table.Summary.Row style={{ height: 40 }}>
          <Table.Summary.Cell index={0} colSpan={2}>
            <div style={{ fontWeight: "bold", textAlign: "right", fontSize: 16 }}>Xếp loại: </div>
          </Table.Summary.Cell>
          <Table.Summary.Cell index={0} colSpan={2}>
            <Tag
              color={getGradingName(calculateTotalAssessmentValue(criteriaData)).color}
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
              {getGradingName(calculateTotalAssessmentValue(criteriaData)).name}
            </Tag>
          </Table.Summary.Cell>
          {supervisors.map((item, index) => {
            const total = calculateTotalAssessmentValueSupervisor(criteriaData, index);
            return (
              <Table.Summary.Cell key={index} index={3 + index} colSpan={1}>
                <Tag
                  color={getGradingName(total).color}
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
                  {getGradingName(total).name}
                </Tag>
              </Table.Summary.Cell>
            );
          })}
        </Table.Summary.Row>
      </>
    )
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
        <EvaluationDetailsUserPrint closeModal={setIsOpenEvaluationDetailsUserPrint} evaluationId={evaluationId} />
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
                //setIsOpenn(true);
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

export default EvaluationDetailsUserCustom;
