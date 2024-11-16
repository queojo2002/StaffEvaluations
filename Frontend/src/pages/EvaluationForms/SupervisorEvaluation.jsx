import { useEffect, useState } from "react";
import { EditOutlined, EyeOutlined, SwapOutlined } from "@ant-design/icons";
import { Button, Card, Col, Divider, Row, Space, Spin, Table, Tag } from "antd";
import dayjs from "dayjs";

import EvaluationDetailsSupervisor from "./EvaluationDetailsSupervisor";

import { getEvaluationOfSupervisor } from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import { openNotificationTopLeft } from "~/utils/openNotification";

const SupervisorEvaluation = () => {
  const [id, setId] = useState(null);
  const [idUser, setIdUser] = useState(null);
  const [status, setStatus] = useState(0);
  const [loading, setLoading] = useState(false);
  const [isOpenDrawer, setIsOpenDrawer] = useState(false);

  const [datas, setDatas] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const fetchApiGetAll = async () => {
    setLoading(true);
    try {
      const [data1] = await Promise.all([getEvaluationOfSupervisor()]);
      setDatas(data1.dataList);
    } catch (error) {
      console.error("Error fetching data:", error);
      openNotificationTopLeft("error", "Thông báo lỗi!", error);
    } finally {
      setLoading(false);
    }
  };

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  const openDrawer = (id, status, idUser) => {
    setId(id);
    setIdUser(idUser);
    setStatus(status);
    setIsOpenDrawer(true);
  };

  const handleButtonStatus = (id, status, idUser) => {
    switch (status) {
      case 0:
        return (
          <Button
            onClick={() => {
              openDrawer(id, 0, idUser);
            }}
            type="primary"
            size="middle"
            icon={<SwapOutlined />}
          >
            Thực hiện đánh giá
          </Button>
        );
      case 1:
        return (
          <Button
            onClick={() => {
              openDrawer(id, 1, idUser);
            }}
            type="default"
            size="middle"
            icon={<EditOutlined />}
          >
            Chỉnh sửa đánh giá
          </Button>
        );
      case 2:
      case 3:
      case 4:
        return (
          <Button
            onClick={() => {
              openDrawer(id, 2, idUser);
            }}
            type="default"
            size="middle"
            icon={<EyeOutlined />}
          >
            Xem lại đánh giá
          </Button>
        );
      default:
        return (
          <Button
            onClick={() => {
              openDrawer(id, 2, idUser);
            }}
            type="primary"
            size="middle"
            icon={<SwapOutlined />}
          >
            Thực hiện đánh giá
          </Button>
        );
    }
  };

  const handleShowMessageStatus = (status, statusMessage) => {
    switch (status) {
      case 0:
        return <Tag color="red">Chưa đánh giá</Tag>;
      case 1:
        return <Tag color="yellow">Đã lưu đánh giá</Tag>;
      case 2:
        return <Tag color="purple">Đã thực hiện đánh giá</Tag>;
      case 3:
        return <Tag color="green">Đã đánh giá</Tag>;
      default:
        return <Tag color="red">Chưa đánh giá</Tag>;
    }
  };

  const columns = [
    {
      title: "Tên phiếu đánh giá",
      dataIndex: "evaluationName",
      key: "evaluationName",
      width: 300,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Thuộc đơn vị",
      dataIndex: "unitName",
      width: 250,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Họ và tên",
      dataIndex: "fullName",
      width: 250,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Email",
      dataIndex: "email",
      width: 250,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Ngày bắt đầu đánh giá",
      dataIndex: "fromDate",
      width: 60,
      render: (text, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          {text !== null ? dayjs(text).format("DD-MM-YYYY HH:mm") : null}
        </div>
      )
    },
    {
      title: "Ngày kết thúc đánh giá",
      dataIndex: "toDate",
      width: 80,
      render: (text, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          {text !== null ? dayjs(text).format("DD-MM-YYYY HH:mm") : null}
        </div>
      )
    },
    {
      title: "Trạng thái đánh giá",
      dataIndex: "status",
      width: 80,
      render: (status, record) => (
        <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
          {handleShowMessageStatus(status, record.messageStatus || "")}
        </div>
      )
    },
    {
      title: "Hành động",
      dataIndex: "Action",
      key: "Action",
      render: (item, record) => handleButtonStatus(record.id, record.status || 0, record.userId)
    }
  ];

  const propsTable = {
    scroll: {
      x: 800
    },
    rowKey: (record) => record.id + "_" + record.userId,
    columns: columns.map((item) => ({
      width: 60,
      align: "center",
      ...item
    })),
    rowSelection: rowSelection,
    loading: loading,
    dataSource: datas,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  useEffect(() => {
    fetchApiGetAll();
  }, []);

  return (
    <Spin spinning={loading}>
      <EvaluationDetailsSupervisor
        refetchApi={fetchApiGetAll}
        isOpen={isOpenDrawer}
        setIsOpen={setIsOpenDrawer}
        evaluationId={id}
        userId={idUser}
        status={status}
      />
      <Breadcrumbs />
      <Divider />
      <Row gutter={[24, 0]}>
        <Col xs={24} sm={24} md={24} lg={24} xl={24} className="mb-24">
          <Space
            style={{
              marginBottom: 16
            }}
            wrap
          ></Space>

          <Card bordered={false} className="criclebox">
            <Table {...propsTable} />
          </Card>
        </Col>
      </Row>
    </Spin>
  );
};

export default SupervisorEvaluation;
