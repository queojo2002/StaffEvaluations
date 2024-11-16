import { useEffect, useState } from "react";
import { BiMinus } from "react-icons/bi";
import { IoAddOutline } from "react-icons/io5";
import { CheckCircleOutlined, ReloadOutlined } from "@ant-design/icons";
import {
  Alert,
  Button,
  Col,
  Divider,
  Flex,
  Form,
  Input,
  InputNumber,
  Modal,
  Popconfirm,
  Row,
  Space,
  Spin,
  Switch,
  Table,
  Tag,
  Tooltip
} from "antd";

import {
  getAllNonSupervisorUsers,
  getSupervisorsForEvaluation,
  insertSupervisorIntoEvaluation,
  removeSupervisorFromEvaluation
} from "~/apis";
import { openNotificationTopLeft } from "~/utils/openNotification";
import { listItemBeforeStyle, listItemStyle, listStyle } from "~/utils/styleCustom";

const AddSupervisorToEvaluation = (props) => {
  const { id } = props;

  const [selectedRowKeysAdd, setSelectedRowKeysAdd] = useState([]);
  const [selectedRowKeysRemove, setSelectedRowKeysRemove] = useState([]);
  const [dataOne, setDataOne] = useState([]);
  const [dataTwo, setDataTwo] = useState([]);
  const [loading, setLoading] = useState(false);
  const [isOpenModal, setIsOpenModal] = useState(false);
  const [sort, setSort] = useState(0);
  const [userId, setUserId] = useState(null);
  const [isManager, setIsManager] = useState(false);

  const fetchApiGetAll = async (id) => {
    setLoading(true);

    try {
      const [data1, data2] = await Promise.all([getAllNonSupervisorUsers(id), getSupervisorsForEvaluation(id)]);

      setDataOne(data1.dataList);
      setDataTwo(data2.dataList);
    } catch (error) {
      console.log(error);
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

  const onFinish = async (userId, sort, type, isManager) => {
    setLoading(true);

    setSelectedRowKeysRemove([]);
    setSelectedRowKeysAdd([]);

    const res = type
      ? await insertSupervisorIntoEvaluation({
          evaluationId: id,
          userId: userId,
          sort: sort,
          isManager: isManager
        })
      : await removeSupervisorFromEvaluation({
          evaluationId: id,
          userId: userId
        });

    if (res.isSuccess) {
      await fetchApiGetAll(id);
      setSort(0);
      setUserId(null);
      setIsOpenModal(false);
    }

    setLoading(false);
  };

  const columnsOne = [
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
      title: "Hành động",
      dataIndex: "action",
      width: "10%",
      render: (text, record) => (
        <Flex align="center" justify="center" gap={10}>
          <Tooltip title="Thêm người này làm giám sát viên">
            <Button
              type="primary"
              loading={loading}
              style={{ borderRadius: 10 }}
              icon={<IoAddOutline style={{ padding: 0, margin: "auto", fontSize: 20 }} />}
              onClick={() => {
                setUserId(record.id);
                setIsOpenModal(true);
              }}
            />
          </Tooltip>
        </Flex>
      )
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
      title: "Thứ tự đánh giá",
      dataIndex: "sort",
      width: 130,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Trưởng đợt đánh giá",
      dataIndex: "isManager",
      width: 130,
      render: (isManager) => (
        <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
          {isManager ? <Tag color="green">Phải</Tag> : <Tag color="red">Không phải</Tag>}
        </div>
      )
    },
    {
      title: "Hành động",
      dataIndex: "action",
      width: "10%",
      render: (text, record) => (
        <Flex align="center" justify="center" gap={10}>
          <Popconfirm
            title="Bạn có chắc chắn muốn xoá giám sát viên này khỏi phiếu đánh giá?"
            okText="Có"
            cancelText="Không"
            onConfirm={() => {
              onFinish(record.id, sort, 0);
            }}
          >
            <Button
              danger
              type="primary"
              loading={loading}
              style={{ borderRadius: 10 }}
              icon={<BiMinus style={{ padding: 0, margin: "auto", fontSize: 20 }} />}
            />
          </Popconfirm>
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
    columns: columnsOne.map((item) => ({
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
    <Spin spinning={false}>
      <Modal
        title={"Thêm giám sát viên"}
        open={isOpenModal}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModal(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <Row gutter={16}>
          <Col span={24}>
            <Alert
              message="Mô tả"
              description={
                <ul style={listStyle}>
                  <li style={listItemStyle}>
                    <span style={listItemBeforeStyle}>- </span>Số thứ tự đánh giá là thứ tự được cấu hình cho quá trình
                    đánh giá giữa các cấp trong tổ chức. <br /> Ví dụ: Trưởng bộ môn (STT: 1), Hiệu trưởng (STT: 2).{" "}
                    <br /> Khi giáo viên hoàn thành đánh giá, hệ thống sẽ chuyển đến người đánh giá cấp trên theo thứ tự
                    đã được cấu hình, từ &quot;Trưởng bộ môn&quot; đến &quot;Hiệu trưởng&quot;.
                  </li>
                </ul>
              }
              type="info"
              showIcon
              style={{ marginBottom: 16 }}
            />
          </Col>
          <Col span={24}>
            <InputNumber
              value={sort}
              onChange={(value) => {
                setSort(value);
              }}
              style={{ width: "100%" }}
              placeholder="Nhập số thứ tự đánh giá"
            />
          </Col>

          <Col span={24}>
            <Form.Item
              style={{
                paddingTop: 20
              }}
              name="isManager"
              label="Người này có phải trưởng đợt đánh giá này?"
              valuePropName="checked"
            >
              <Switch
                checkedChildren={"Phải"}
                unCheckedChildren={"Không phải"}
                onChange={(checked) => {
                  setIsManager(checked);
                }}
              />
            </Form.Item>
          </Col>

          <Col span={24}>
            <Divider />
          </Col>
          <Col span={24}>
            <Space
              style={{
                width: "100%",
                justifyContent: "flex-end"
              }}
            >
              <Button type="default" htmlType="reset" loading={loading} icon={<ReloadOutlined />}>
                Tải lại
              </Button>
              <Button
                type="primary"
                htmlType="submit"
                loading={loading}
                icon={<CheckCircleOutlined />}
                style={{
                  float: "right"
                }}
                onClick={() => {
                  onFinish(userId, sort, 1, isManager);
                }}
              >
                Lưu thao tác
              </Button>
            </Space>
          </Col>
        </Row>
      </Modal>

      <Form layout={"vertical"} labelCol={{ span: 24 }} wrapperCol={{ span: 24 }}>
        <Form.Item name={"idEvaluations"} hidden>
          <Input value={null} />
        </Form.Item>
        <Row gutter={16}>
          <Col span={24}>
            <Alert
              message="Lưu ý"
              description={
                <ul style={listStyle}>
                  <li style={listItemStyle}>
                    <span style={listItemBeforeStyle}>- </span>Khi phiếu đánh giá này đã dữ liệu thì sẽ không thể chỉnh
                    sửa hay thêm người giám sát được nữa !
                  </li>
                </ul>
              }
              type="info"
              showIcon
              style={{ marginBottom: 16 }}
            />
          </Col>

          <Col span={24}>
            <Table {...propsTableAdd} />
          </Col>

          <Col span={24}>
            <Divider />
          </Col>

          <Col span={24}>
            <Table {...propsTableRemove} />
          </Col>
        </Row>
      </Form>
    </Spin>
  );
};

export default AddSupervisorToEvaluation;
