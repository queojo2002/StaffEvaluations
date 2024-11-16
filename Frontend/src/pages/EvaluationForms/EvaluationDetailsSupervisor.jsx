import { useEffect, useState } from "react";
import { CloseOutlined, EditOutlined, RightCircleFilled, SaveOutlined, SendOutlined } from "@ant-design/icons";
import { Button, Col, Drawer, Dropdown, Input, Modal, Row, Space, Table, Tabs, Tag, Typography } from "antd";

import SupervisorEvaluationResult from "./EvaluationDetailsSupervisorComponents/SupervisorEvaluationResult";
import EvaluationSubmissionConfirmation from "./EvaluationDetailsUserComponents/EvaluationSubmissionConfirmation";
import NewAndUpdateEvaluationExplaint from "./EvaluationDetailsUserComponents/NewAndUpdateEvaluationExplaint";

import { checkIsManager, getListCriteriaInEvaluationsOfSupervisor, insertEvaluationDetailsSupervisor } from "~/apis";
import { calculateTotalAssessmentValue } from "~/utils/calculateTotalAssessmentValue";
import { calculateTotalAssessmentValueDynamic } from "~/utils/calculateTotalAssessmentValueDynamic";
import { getTotalAssessmentValueSupervisorDynamic } from "~/utils/getTotalAssessmentValueSupervisorDynamic";
import { openNotificationTopLeft } from "~/utils/openNotification";

const EvaluationDetailsSupervisor = (props) => {
  const { isOpen, setIsOpen, evaluationId, userId, status, refetchApi } = props;
  const { Text } = Typography;

  const [data, setData] = useState([]);
  const [dataSupervisors, setDataSupervisors] = useState([]);
  const [userIds, setUserIds] = useState([]);
  const [loading, setLoading] = useState(false);
  const [file, setFile] = useState(null);
  const [activeTabKey, setActiveTabKey] = useState("2");
  const [openSendEvaluation, setOpenSendEvaluation] = useState(false);
  const [isPrincipal, setIsPrincipal] = useState(false);
  const [isOpenNewAndUpdateEvaluationExplaint, setIsOpenNewAndUpdateEvaluationExplaint] = useState(false);
  const [nameCriteriaDisplay, setNameCriteriaDisplay] = useState("");
  const [explaintCategoryCriteriaId, setExplaintCategoryCriteriaId] = useState(null);
  const [bindingNhanXetUuKhuyetDiem, setBindingNhanXetUuKhuyetDiem] = useState("");
  const [bindingNhanDinhChieuHuongPhatTrien, setBindingNhanDinhChieuHuongPhatTrien] = useState("");

  const fetchApiGetAll = async (evaluationId, userId) => {
    setLoading(true);
    try {
      const [data1, data2] = await Promise.all([
        getListCriteriaInEvaluationsOfSupervisor(evaluationId, userId),
        checkIsManager(evaluationId)
      ]);
      setData(data1.data.criteriaList);
      if (data1.data.supervisorList !== null) {
        setDataSupervisors(data1.data.supervisorList);
        setUserIds((prev) => [...prev, ...data1.data.supervisorList.map((supervisor) => supervisor.userId), userId]);
      }
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

  const calculateTotalAssessmentValueSupervisor = (children) => {
    let total = 0;
    children.forEach((child) => {
      if (child.children && child.children.length > 0) {
        total += calculateTotalAssessmentValueSupervisor(child.children);
      } else {
        total += child.assessmentValueSupervisor || child.startValue || 0;
      }
    });
    return total;
  };

  const getTotalAssessmentValue = (data) => {
    let total = 0;
    data.forEach((item) => {
      if (item.children && item.children.length > 0) {
        total += calculateTotalAssessmentValueSupervisor(item.children);
      } else {
        total += item.assessmentValueSupervisor || item.startValue;
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

  const resetOtherAssessments = (data, parentIdToReset, evaluationDetailPersonalId) => {
    return data.map((item) => {
      if (item.parentId === parentIdToReset && item.evaluationDetailPersonalId !== evaluationDetailPersonalId) {
        return {
          ...item,
          assessmentValue: 0,
          children: item.children?.length
            ? resetOtherAssessments(item.children, parentIdToReset, evaluationDetailPersonalId)
            : []
        };
      }
      if (item.children?.length) {
        return { ...item, children: resetOtherAssessments(item.children, parentIdToReset, evaluationDetailPersonalId) };
      }
      return item;
    });
  };

  const updateData = (data, evaluationDetailPersonalId, parentId, isDistinct, value) => {
    return data.map((item) => {
      if (item.evaluationDetailPersonalId === evaluationDetailPersonalId) {
        return { ...item, assessmentValueSupervisor: value || 0 };
      }

      if (item.idParent === parentId && isDistinct) {
        return {
          ...item,
          assessmentValueSupervisor: 0,
          children: item.children?.length ? resetChildrenAssessment(item.children) : []
        };
      }

      if (item.children?.length) {
        return {
          ...item,
          children: updateData(item.children, evaluationDetailPersonalId, parentId, isDistinct, value)
        };
      }

      return item;
    });
  };

  const handleInputChange = (value, evaluationDetailPersonalId, parentId) => {
    const listCategoryCriteria = [...data]; // Create a shallow copy of the data

    const isDistinct = checkDistinct(listCategoryCriteria, parentId);

    // Determine the parentId of the item being changed
    const parentIdToReset =
      data.find((item) => item.evaluationDetailPersonalId === evaluationDetailPersonalId)?.parentId || null;

    // Update the data and reset other assessments
    const updatedData = updateData(
      resetOtherAssessments(listCategoryCriteria, parentIdToReset, evaluationDetailPersonalId),
      evaluationDetailPersonalId,
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

  const getValues = (data) => {
    const values = [];
    const collectValues = (items) => {
      items.forEach((item) => {
        if (!item.children || item.children.length === 0) {
          if (item.assessmentValueSupervisor !== undefined) {
            values.push({
              evaluationDetailPersonalId: item.evaluationDetailPersonalId,
              assessmentValueSupervisor: item.assessmentValueSupervisor ?? 0
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

  const copyValues = (type) => {
    const updateData = (child) => {
      return child.map((criteria) => {
        const updatedCriteria = { ...criteria };

        if (type === 1) {
          updatedCriteria.assessmentValueSupervisor = criteria.assessmentValue;
        } else if (type === 2 && criteria.supervisorEvaluations?.length > 0) {
          const lastEvaluation = criteria.supervisorEvaluations[criteria.supervisorEvaluations.length - 1];
          updatedCriteria.assessmentValueSupervisor = lastEvaluation?.assessmentValueSupervisor || 0;
        }

        // Nếu có tiêu chí con, tiếp tục đệ quy
        if (updatedCriteria.children?.length > 0) {
          updatedCriteria.children = updateData(updatedCriteria.children);
        }

        return updatedCriteria;
      });
    };

    // Cập nhật dữ liệu
    setData((prevData) => updateData(prevData));
  };

  const handleCopyClick = (e) => {
    if (e === 1) {
      copyValues(1);
    } else if (e === 2) {
      copyValues(2);
    }
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

  const itemsDropdown = [
    {
      key: "1",
      label: "Sao chép theo điểm cá nhân tự đánh giá",
      onClick: () => {
        handleCopyClick(1);
      }
    },
    {
      key: "2",
      label: "Sao chép theo điểm giám sát viên gần nhất",
      onClick: () => {
        handleCopyClick(2);
      }
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
      width: 150,
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
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>Điểm cá nhân tự đánh giá</div>,
      dataIndex: "assessmentValue",
      key: "assessmentValue",
      width: 150,
      render: (assessmentValue, record) => {
        if (record.children && record.children.length > 0) {
          const total = calculateTotalAssessmentValue(record.children);
          return (
            <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
              {
                <Tag
                  style={{
                    width: "100%",
                    textAlign: "center",
                    height: 40,
                    fontSize: 16,
                    alignContent: "center",
                    fontWeight: "bold"
                  }}
                >
                  {total}
                </Tag>
              }
            </div>
          );
        } else {
          return (
            <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
              {
                <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 16, alignContent: "center" }}>
                  {assessmentValue}
                </Tag>
              }
            </div>
          );
        }
      }
    },
    ...dataSupervisors.map((item, index) => ({
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>{item.fullName}</div>,
      dataIndex: `assessmentValue_${item.userId}`,
      key: `assessmentValue_${item.userId}`,
      width: 150,
      render: (assessmentValue, record) => {
        if (record.children && record.children.length > 0) {
          const total = calculateTotalAssessmentValueDynamic(record.children, index);
          return (
            <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
              {
                <Tag
                  style={{
                    width: "100%",
                    textAlign: "center",
                    height: 40,
                    fontSize: 16,
                    alignContent: "center",
                    fontWeight: "bold"
                  }}
                >
                  {total}
                </Tag>
              }
            </div>
          );
        } else {
          return (
            <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
              {
                <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 16, alignContent: "center" }}>
                  {record.supervisorEvaluations[index]?.assessmentValueSupervisor}
                </Tag>
              }
            </div>
          );
        }
      }
    })),
    {
      title: <div style={{ fontSize: 16, fontWeight: "bold" }}>Điểm cấp trên đánh giá</div>,
      dataIndex: "assessmentValueSupervisor",
      key: "assessmentValueSupervisor",
      width: 150,
      render: (assessmentValueSupervisor, record) => {
        if (record.children && record.children.length > 0) {
          const total = calculateTotalAssessmentValueSupervisor(record.children);
          return (
            <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
              {
                <Tag
                  style={{
                    width: "100%",
                    textAlign: "center",
                    height: 40,
                    fontSize: 16,
                    alignContent: "center",
                    fontWeight: "bold"
                  }}
                >
                  {total}
                </Tag>
              }
            </div>
          );
        } else {
          return (status ?? 0) >= 2 ? (
            <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
              {
                <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 16, alignContent: "center" }}>
                  {record.assessmentValueSupervisor}
                </Tag>
              }
            </div>
          ) : (
            <Input
              type="number"
              value={record.assessmentValueSupervisor ? record.assessmentValueSupervisor : record.startValue}
              min={record.startValue}
              max={record.endValue}
              onChange={(e) => {
                let value = parseInt(e.target.value.replace(/[^0-9]/g, ""), 10) || 0;
                if (value > record.endValue) {
                  value = record.endValue;
                } else if (value < 0) {
                  value = 0;
                }
                handleInputChange(value, record.evaluationDetailPersonalId, record.parentId);
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
      }
    },
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
            setExplaintCategoryCriteriaId(id);
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
    rowKey: (record) => (record.evaluationDetailPersonalId === null ? record.id : record.evaluationDetailPersonalId),
    columns: columns.map((item) => ({
      align: "center",
      ...item
    })),
    loading: loading,
    dataSource: data,
    expandedRowKeys: data?.flatMap((item) => {
      const keys = [item.evaluationDetailPersonalId === null ? item.id : item.evaluationDetailPersonalId];
      if (item.children) {
        keys.push(
          ...item.children.map((child) =>
            child.evaluationDetailPersonalId === null ? child.id : child.evaluationDetailPersonalId
          )
        );
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
              {calculateTotalAssessmentValue(data)}
            </Tag>
          </Table.Summary.Cell>
          {dataSupervisors.map((item, index) => {
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
          })}
          <Table.Summary.Cell index={3} colSpan={1}>
            <Tag
              color="green"
              style={{
                width: "100%",
                textAlign: "center",
                height: 40,
                fontSize: 16,
                alignContent: "center",
                fontWeight: "bold"
              }}
            >
              {getTotalAssessmentValue(data)}
            </Tag>
          </Table.Summary.Cell>
        </Table.Summary.Row>

        <Table.Summary.Row style={{ height: 40 }}>
          <Table.Summary.Cell index={0} colSpan={2}>
            <div style={{ fontWeight: "bold", textAlign: "right", fontSize: 16 }}>Xếp loại: </div>
          </Table.Summary.Cell>

          <Table.Summary.Cell index={0} colSpan={2}>
            <Tag
              color={getGradingName(calculateTotalAssessmentValue(data)).color}
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
              {getGradingName(calculateTotalAssessmentValue(data)).name}
            </Tag>
          </Table.Summary.Cell>
          {dataSupervisors.map((item, index) => {
            const total = getTotalAssessmentValueSupervisorDynamic(data, index);
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
        </Table.Summary.Row>
      </>
    )
  };

  const onFinish = async (isSave) => {
    setLoading(true);
    const values = getValues(data);
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
          userIds={userIds}
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
              // onClick={showModalxx}
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

export default EvaluationDetailsSupervisor;
