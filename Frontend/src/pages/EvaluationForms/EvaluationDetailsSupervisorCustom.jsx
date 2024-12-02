import { useEffect, useState } from "react";
import { CloseOutlined, EditOutlined, RightCircleFilled, SaveOutlined, SendOutlined } from "@ant-design/icons";
import { Button, Col, Drawer, Dropdown, Input, Modal, Row, Space, Table, Tabs, Tag, Typography } from "antd";

import SupervisorEvaluationResult from "./EvaluationDetailsSupervisorComponents/SupervisorEvaluationResult";
import EvaluationDetailsUserPrint from "./EvaluationDetailsUserComponents/EvaluationDetailsUserPrint";
import EvaluationSubmissionConfirmation from "./EvaluationDetailsUserComponents/EvaluationSubmissionConfirmation";
import ManagerExclusiveSection from "./EvaluationDetailsUserComponents/ManagerExclusiveSection";
import NewAndUpdateEvaluationExplaint from "./EvaluationDetailsUserComponents/NewAndUpdateEvaluationExplaint";
import SelfEvaluationResults from "./EvaluationDetailsUserComponents/SelfEvaluationResults";
import SelfReviewAndQualityRating from "./EvaluationDetailsUserComponents/SelfReviewAndQualityRating";

import {
  checkIsManagementMember,
  checkIsManager,
  getAllCategoryComment,
  getAllCategoryProsCons,
  getListCriteriaInEvaluationsOfSupervisorCustom,
  getListCriteriaInEvaluationsOfUserCustom,
  insertEvaluationDetailsPersonal,
  insertEvaluationDetailsSupervisor
} from "~/apis";
import { calculateTotalAssessmentValue } from "~/utils/calculateTotalAssessmentValue";
import { getGradingName } from "~/utils/getGradingName";
import { openNotificationTopLeft } from "~/utils/openNotification";

const EvaluationDetailsSupervisorCustom = (props) => {
  const { isOpen, setIsOpen, evaluationId, userId, status, refetchApi } = props;

  const { Text } = Typography;

  const [loading, setLoading] = useState(false);
  const [criteriaData, setCriteriaData] = useState([]);
  const [supervisors, setSupervisors] = useState([]);
  const [isPrincipal, setIsPrincipal] = useState(false);
  const [itemsDropdown, setItemsDropdown] = useState([]);
  const [userIds, setUserIds] = useState([]);
  const [file, setFile] = useState(null);
  const [activeTabKey, setActiveTabKey] = useState("2");
  const [openSendEvaluation, setOpenSendEvaluation] = useState(false);
  const [isOpenNewAndUpdateEvaluationExplaint, setIsOpenNewAndUpdateEvaluationExplaint] = useState(false);
  const [nameCriteriaDisplay, setNameCriteriaDisplay] = useState("");
  const [explaintCategoryCriteriaId, setExplaintCategoryCriteriaId] = useState(null);
  const [bindingNhanXetUuKhuyetDiem, setBindingNhanXetUuKhuyetDiem] = useState("");
  const [bindingNhanDinhChieuHuongPhatTrien, setBindingNhanDinhChieuHuongPhatTrien] = useState("");

  const fetchApiGetAll = async (evaluationId, userId) => {
    setLoading(true);
    try {
      const [data1, data2] = await Promise.all([
        getListCriteriaInEvaluationsOfSupervisorCustom(evaluationId, userId),
        checkIsManager(evaluationId)
      ]);
      setCriteriaData(data1.data.criteriaData);
      setSupervisors(data1.data.criteriaData[0].assessmentResults);
      setUserIds(data1.data.criteriaData[0].assessmentResults.map((supervisor) => supervisor.userId));
      setItemsDropdown(
        data1.data.criteriaData[0].assessmentResults.map((supervisor, index) => ({
          key: index.toString(), // Sử dụng index làm key
          label: (
            <span>
              Sao chép theo điểm của <span style={{ color: "red" }}>{supervisor.fullName}</span>
            </span>
          ),
          onClick: () => {
            copyValues(index); // Gọi hàm với tham số index
          }
        }))
      );
      if (data2.data !== null) {
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
          evaluationDetailPersonalId: item.evaluationDetailPersonalId,
          assessmentValueSupervisor: item.assessmentValue
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

  const onFinish = async (isSave) => {
    setLoading(true);

    const values = flattenCriteriaData(criteriaData);

    let formattedValues = {};
    if (!isSave) {
      if (isPrincipal === true && (!bindingNhanXetUuKhuyetDiem || !bindingNhanDinhChieuHuongPhatTrien)) {
        setLoading(false);
        openNotificationTopLeft("warning", "Cảnh báo", "Vui lòng điền đầy đủ thông tin!");
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
        userId: userId,
        userCriteriaEvaluations: values,
        evaluationDetails: {
          nhanXetUuKhuyetDiem: bindingNhanXetUuKhuyetDiem,
          nhanDinhChieuHuongPhatTrien: bindingNhanDinhChieuHuongPhatTrien
        }
      };
    } else {
      formattedValues = {
        evaluationId: evaluationId,
        evaluationStatus: 1,
        userId: userId,
        userCriteriaEvaluations: values,
        evaluationDetails: {
          nhanXetUuKhuyetDiem: null,
          nhanDinhChieuHuongPhatTrien: null
        }
      };
    }

    const res = await insertEvaluationDetailsSupervisor(formattedValues, file);

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
    ...supervisorColumns,
    {
      title: <div style={{ fontSize: 14 }}>Điểm cấp trên đánh giá</div>,
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
    rowKey: (record) => (record.evaluationDetailPersonalId === null ? record.id : record.evaluationDetailPersonalId),
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
        </Table.Summary.Row>

        <Table.Summary.Row style={{ height: 40 }}>
          <Table.Summary.Cell index={0} colSpan={2}>
            <div style={{ fontWeight: "bold", textAlign: "right", fontSize: 16 }}>Xếp loại: </div>
          </Table.Summary.Cell>

          <Table.Summary.Cell index={0} colSpan={1}>
            <Tag
              color={getGradingName(100).color}
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
              {getGradingName(100).name}
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

          <Table.Summary.Cell index={0} colSpan={1}>
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
        </Table.Summary.Row>
      </>
    )
  };

  const items = [
    {
      key: "1",
      label: `KẾT QUẢ ĐÁNH GIÁ, XẾP LOẠI CHẤT LƯỢNG CÁN BỘ VIÊN CHỨC`,
      children: (
        <SupervisorEvaluationResult
          bindingNhanXetUuKhuyetDiem={bindingNhanXetUuKhuyetDiem}
          bindingNhanDinhChieuHuongPhatTrien={bindingNhanDinhChieuHuongPhatTrien}
          setBindingNhanXetUuKhuyetDiem={setBindingNhanXetUuKhuyetDiem}
          setBindingNhanDinhChieuHuongPhatTrien={setBindingNhanDinhChieuHuongPhatTrien}
        />
      ),
      disabled: !isPrincipal
    },
    {
      key: "2",
      label: `XÁC NHẬN GỬI ĐÁNH GIÁ`,
      children: <EvaluationSubmissionConfirmation setFile={setFile} />
    }
  ];

  const copyValues = (indexCopy) => {
    // Hàm đệ quy cập nhật giá trị
    const updateCriteria = (criteriaData) =>
      criteriaData.map((criteria) => {
        // Tạo bản sao của tiêu chí để không thay đổi dữ liệu gốc
        const updatedCriteria = { ...criteria };

        // Xử lý gán giá trị dựa trên chỉ mục
        updatedCriteria.assessmentValue = criteria.assessmentResults[indexCopy]?.score || 0;

        // Đệ quy xử lý danh sách con nếu có
        if (criteria.children?.length > 0) {
          updatedCriteria.children = updateCriteria(criteria.children);
        }

        return updatedCriteria;
      });

    // Cập nhật dữ liệu thông qua setState
    setCriteriaData((prevCriteriaData) => updateCriteria(prevCriteriaData));
  };

  useEffect(() => {
    if (evaluationId && userId) {
      fetchApiGetAll(evaluationId, userId);
    }
  }, [evaluationId, userId]);

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
          activeTabKey === "2"
            ? () => {
                onFinish(0);
              }
            : () => {}
        }
        onCancel={() => {
          setActiveTabKey(!isPrincipal ? "2" : "1");
          setOpenSendEvaluation(false);
        }}
        footer={activeTabKey === "2" ? undefined : null}
        style={{
          top: 20
        }}
      >
        <Tabs
          defaultActiveKey={isPrincipal ? "1" : "2"}
          activeKey={activeTabKey}
          onChange={setActiveTabKey}
          items={items}
        />
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
          userId={userId}
          userIds={userIds}
          type={2}
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
              Ký duyệt
            </Button>

            <Dropdown
              menu={{
                items: itemsDropdown
              }}
              trigger={["click"]}
            >
              <Button
                hidden={status === 2 ? true : false}
                icon={<RightCircleFilled />}
                style={{ fontSize: 14, width: 160, height: 40, color: "white", backgroundColor: "#01643c" }}
              >
                Sao chép điểm
              </Button>
            </Dropdown>

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

export default EvaluationDetailsSupervisorCustom;
