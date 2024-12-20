import { useEffect, useState } from "react";
import { BsSendArrowDown } from "react-icons/bs";
import { ArrowDownOutlined, ArrowUpOutlined } from "@ant-design/icons";
import { Alert, Button, Col, Row, Space, Spin, Table } from "antd";

import {
  getUsersAllowedToEvaluate,
  getUsersNotAllowedToEvaluate,
  insertUserIntoEvaluation,
  removeUserFromEvaluation,
  sendMailAPI
} from "~/apis";
import { openNotificationTopLeft } from "~/utils/openNotification";
const AddUserToEvaluation = (props) => {
  const { id } = props;

  const [loadingButtonSendMail, setLoadingButtonSendMail] = useState(false);
  const [selectedRowKeysAdd, setSelectedRowKeysAdd] = useState([]);
  const [selectedRowKeysRemove, setSelectedRowKeysRemove] = useState([]);
  const [dataOne, setDataOne] = useState([]);
  const [dataTwo, setDataTwo] = useState([]);
  const [loading, setLoading] = useState(false);
  const hasSelectedAdd = selectedRowKeysAdd.length > 0;
  const hasSelectedRemove = selectedRowKeysRemove.length > 0;

  const fetchApiGetAll = async (id) => {
    setLoading(true);

    try {
      const [data1, data2] = await Promise.all([getUsersNotAllowedToEvaluate(id), getUsersAllowedToEvaluate(id)]);

      setDataOne(data1.dataList);
      setDataTwo(data2.dataList);
    } catch (error) {
      openNotificationTopLeft("error", "Thông báo lỗi!", error);
    } finally {
      setLoading(false);
    }
  };

  const onSelectChangeAdd = (newSelectedRowKeys) => {
    setSelectedRowKeysAdd(newSelectedRowKeys);
  };

  const onSelectChangeRemove = (newSelectedRowKeys) => {
    setSelectedRowKeysRemove(newSelectedRowKeys);
  };

  const rowSelectionAdd = {
    selectedRowKeys: selectedRowKeysAdd,
    onChange: onSelectChangeAdd
  };

  const rowSelectionRemove = {
    selectedRowKeys: selectedRowKeysRemove,
    onChange: onSelectChangeRemove
  };

  const onFinish = async (type) => {
    setLoading(true);

    setSelectedRowKeysRemove([]);
    setSelectedRowKeysAdd([]);

    const res = type
      ? await insertUserIntoEvaluation({
          evaluationId: id,
          userIds: selectedRowKeysAdd
        })
      : await removeUserFromEvaluation({
          evaluationId: id,
          userIds: selectedRowKeysRemove
        });

    if (res.isSuccess) {
      await fetchApiGetAll(id);
    }

    setLoading(false);
  };

  const sendMail = async (userId, evaluationId) => {
    setLoadingButtonSendMail(true);

    const sendRes = await sendMailAPI(userId, evaluationId);

    if (sendRes.isSuccess) {
      openNotificationTopLeft("success", "Thông báo!", "Gửi email nhắc nhở thành công");
    }

    setLoadingButtonSendMail(false);
  };

  const columns = [
    {
      title: "Họ và tên",
      dataIndex: "fullName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Đơn vị",
      dataIndex: "unitName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Loại người dùng",
      dataIndex: "userTypeName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Chức danh",
      dataIndex: "positionsName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Email",
      dataIndex: "email",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Số điện thoại",
      dataIndex: "phone",
      width: 130,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    }
  ];

  const columnsTwo = [
    {
      title: "Họ và tên",
      dataIndex: "fullName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Đơn vị",
      dataIndex: "unitName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Loại người dùng",
      dataIndex: "userTypeName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Chức danh",
      dataIndex: "positionsName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Email",
      dataIndex: "email",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Số điện thoại",
      dataIndex: "phone",
      width: 130,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Trạng thái đánh giá",
      dataIndex: "status",
      width: 130,
      render: (status, record) => (
        <Button
          onClick={() => {
            sendMail(record.id, id);
          }}
          disabled={!!status}
          type="primary"
          icon={<BsSendArrowDown />}
          loading={loadingButtonSendMail}
        >
          Nhắc nhở
        </Button>
      )
    }
  ];

  const propsTableAdd = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelectionAdd,
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    loading: loading,
    dataSource: dataOne,
    pagination: { pageSize: 5, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  const propsTableRemove = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelectionRemove,
    columns: columnsTwo.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    loading: loading,
    dataSource: dataTwo,
    pagination: { pageSize: 5, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  useEffect(() => {
    if (id) {
      fetchApiGetAll(id);
    }
  }, [id]);

  return (
    <Spin spinning={loading}>
      <Row gutter={(16, 24)}>
        <Col span={24}>
          <Table
            title={() => (
              <Alert
                message="Danh sách người dùng chưa được phép đánh giá"
                type={"error"}
                showIcon
                style={{ marginBottom: 16 }}
              />
            )}
            {...propsTableAdd}
          />
        </Col>
        <Col
          span={24}
          style={{
            paddingTop: 10,
            paddingBottom: 10,
            textAlign: "center"
          }}
        >
          <Space>
            <Button
              onClick={() => {
                onFinish(1);
              }}
              disabled={!hasSelectedAdd}
              type="primary"
              icon={<ArrowDownOutlined />}
            >
              Thêm {selectedRowKeysAdd.length} người dùng vào phiếu
            </Button>
            <Button
              onClick={() => {
                onFinish(0);
              }}
              disabled={!hasSelectedRemove}
              type="primary"
              danger
              icon={<ArrowUpOutlined />}
            >
              Xoá {selectedRowKeysRemove.length} người dùng khỏi phiếu
            </Button>
            {/* <Button
              onClick={() => {
                onFinish(0);
              }}
              type="primary"
              icon={<BsSendArrowDown />}
            >
              Gửi email nhắc nhở cho toàn bộ người dùng
            </Button> */}
          </Space>
        </Col>
        <Col span={24}>
          <Table
            title={() => (
              <Alert
                message={
                  <span>
                    Tổng số lượng người dùng tham gia Phiếu đánh giá này là:{" "}
                    <strong style={{ color: "#1890ff", fontSize: "14px" }}>{dataTwo.length}</strong>
                  </span>
                }
                type="success"
                showIcon
                style={{ marginBottom: 16 }}
              />
            )}
            {...propsTableRemove}
          />
        </Col>
      </Row>
    </Spin>
  );
};

export default AddUserToEvaluation;
