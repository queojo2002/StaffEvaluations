import { useEffect, useState } from "react";
import { EditOutlined, EyeOutlined, SwapOutlined } from "@ant-design/icons";
import { Button, Card, Col, Divider, Modal, Row, Space, Spin, Table, Tag } from "antd";
import dayjs from "dayjs";

import EvaluationDetailsUser from "./EvaluationDetailsUser";
import EvaluationDetailsUserCustom from "./EvaluationDetailsUserCustom";

import { getEvaluationOfUser } from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import { openNotificationTopLeft } from "~/utils/openNotification";

const SelfEvaluation = () => {
  const [id, setId] = useState(null);
  const [userId, setUserId] = useState(null);
  const [status, setStatus] = useState(0);
  const [loading, setLoading] = useState(false);
  const [isOpenDrawer, setIsOpenDrawer] = useState(false);

  const [datas, setDatas] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const fetchApiGetAll = async () => {
    setLoading(true);
    try {
      const [data1] = await Promise.all([getEvaluationOfUser()]);
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

  const openDrawer = (id, status) => {
    setId(id);
    setStatus(status);
    setIsOpenDrawer(true);
  };

  const handleButtonStatus = (id, status) => {
    switch (status) {
      case 0:
        return (
          <Button
            onClick={() => {
              openDrawer(id, 0);
            }}
            type="primary"
            size="middle"
            icon={<SwapOutlined />}
          >
            Thực hiện
          </Button>
        );
      case 1:
        return (
          <Button
            onClick={() => {
              openDrawer(id, 1);
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
              openDrawer(id, 2);
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
              openDrawer(id, 2);
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
        return <Tag color="purple">Đã thực hiện đánh giá - Chờ cấp trên đánh giá</Tag>;
      case 3:
        return <Tag color="green">{statusMessage}</Tag>;
      case 4:
        return <Tag color="magenta">{statusMessage}</Tag>;
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
      render: (item, record) => handleButtonStatus(record.id, record.status || 0)
    }
  ];

  const propsTable = {
    scroll: {
      x: 800
    },
    rowKey: "id",
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
      <EvaluationDetailsUserCustom
        refetchApi={fetchApiGetAll}
        isOpen={isOpenDrawer}
        setIsOpen={setIsOpenDrawer}
        evaluationId={id}
        status={status}
      />

      {/* <EvaluationDetailsUser
        refetchApi={fetchApiGetAll}
        isOpen={isOpenDrawer}
        setIsOpen={setIsOpenDrawer}
        evaluationId={id}
        status={status}
      /> */}

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

export default SelfEvaluation;
