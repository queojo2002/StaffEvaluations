import { useState } from "react";
import { AiFillEdit } from "react-icons/ai";
import { FaEye } from "react-icons/fa";
import { MdFingerprint } from "react-icons/md";
import { ArrowDownOutlined, ArrowUpOutlined } from "@ant-design/icons";
import { Button, Col, Flex, Row, Space, Spin, Table, Tooltip } from "antd";
const AddUserToEvaluation = () => {
  const [selectedRowKeysAdd, setSelectedRowKeysAdd] = useState([]);
  const [selectedRowKeysRemove, setSelectedRowKeysRemove] = useState([]);
  const [dataOne, setDataOne] = useState([]);
  const [dataTwo, setDataTwo] = useState([]);
  const [loading, setLoading] = useState(false);
  const hasSelectedAdd = selectedRowKeysAdd.length > 0;
  const hasSelectedRemove = selectedRowKeysRemove.length > 0;

  const onSelectChangeAdd = (newSelectedRowKeys) => {
    setSelectedRowKeysAdd(newSelectedRowKeys);
  };

  const onSelectChangeRemove = (newSelectedRowKeys) => {
    setSelectedRowKeysRemove(newSelectedRowKeys);
  };

  const rowSelectionAdd = {
    selectedRowKeysAdd,
    onChange: onSelectChangeAdd
  };

  const rowSelectionRemove = {
    selectedRowKeysRemove,
    onChange: onSelectChangeRemove
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
    },
    {
      title: "Địa chỉ",
      dataIndex: "address",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Hành động",
      dataIndex: "action",
      width: "10%",
      render: (text, record) => (
        <Flex align="center" justify="center" gap={10}>
          <Tooltip title="Tải chữ ký số">
            <Button
              loading={loadingButtonDownloadSignature}
              style={{ borderRadius: 10 }}
              icon={<MdFingerprint style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                //handleButtonDownloadSignature(record.id, record.fullName);
              }}
            />
          </Tooltip>
          <Tooltip title="Xem chi tiết">
            <Button
              style={{ borderRadius: 10 }}
              icon={<FaEye style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                //handleButtonViewDetail(record.id);
              }}
            />
          </Tooltip>
          <Tooltip title="Chỉnh sửa">
            <Button
              style={{ borderRadius: 10 }}
              icon={<AiFillEdit style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                //handleButtonEdit(record.id);
              }}
            />
          </Tooltip>
        </Flex>
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
    dataSource: dataOne,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  const propsTableRemove = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelectionRemove,
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    dataSource: dataTwo,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  return (
    <Spin spinning={loading}>
      <Row gutter={(16, 24)}>
        <Col span={24}>
          <Table {...propsTableAdd} />
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
            <Button disabled={!hasSelectedAdd} type="primary" icon={<ArrowDownOutlined />}>
              Thêm người dùng vào phiếu
            </Button>
            <Button disabled={!hasSelectedRemove} type="primary" danger icon={<ArrowUpOutlined />}>
              Xoá người dùng khỏi phiếu
            </Button>
          </Space>
        </Col>
        <Col span={24}>
          <Table {...propsTableRemove} />
        </Col>
      </Row>
    </Spin>
  );
};

export default AddUserToEvaluation;
