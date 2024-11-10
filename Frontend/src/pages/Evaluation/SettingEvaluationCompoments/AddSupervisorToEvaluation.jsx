import React, { useState } from "react";
import { CheckCircleOutlined, DeleteOutlined, EditOutlined, RetweetOutlined, SettingOutlined } from "@ant-design/icons";
import {
  Alert,
  Button,
  Card,
  Col,
  Divider,
  Form,
  Input,
  InputNumber,
  Popconfirm,
  Row,
  Select,
  Space,
  Spin,
  Table
} from "antd";

import { listItemBeforeStyle, listItemStyle, listStyle } from "~/utils/styleCustom";

const AddSupervisorToEvaluation = () => {
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  const columns = [
    {
      title: "Tên người giám sát",
      dataIndex: "idUser",
      key: "idUser",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}></div>
    },
    {
      title: "Đơn vị",
      dataIndex: "idUser",
      key: "idUser",
      render: (unitId) => {
        const user = ListUser?.listPayload?.find((item) => item.id === unitId);
        if (user) {
          return <div style={{ whiteSpace: "break-spaces", width: "100%" }}></div>;
        }
      }
    },
    {
      title: "Loại người dùng",
      dataIndex: "idUser",
      key: "idUser",
      render: (text) => {
        const user = ListUser?.listPayload?.find((item) => item.id === text);
        if (user) {
          return <div style={{ whiteSpace: "break-spaces", width: "100%" }}></div>;
        }
      }
    },
    {
      title: "Thứ tự đánh giá",
      dataIndex: "sort",
      key: "sort",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Ngày tạo",
      dataIndex: "createdDate",
      key: "createdDate",
      render: (text) => dayjs(text).format("DD-MM-YYYY HH:mm")
    },
    {
      title: "Hành động",
      dataIndex: "Action",
      key: "Action"
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
      width: 150,
      ...item
    })),
    rowSelection: rowSelection,
    dataSource: null,
    pagination: false,
    size: "middle"
  };

  return (
    <Spin spinning={false}>
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
            <Form.Item
              label="Người giám sát: "
              name={"idUser"}
              rules={[
                {
                  required: true,
                  message: "Vui lòng chọn Người giám sát"
                }
              ]}
            >
              <Select
                allowClear
                showSearch
                //loading={LoadingListUserParentAndChildren}
                optionFilterProp={"label"}
                //options={options}
              />
            </Form.Item>
          </Col>

          <Col span={24}>
            <Form.Item
              label="Số thứ tự đánh giá: "
              name={"sort"}
              rules={[
                {
                  required: true,
                  message: "Vui lòng nhập Số thứ tự đánh giá"
                },
                {
                  pattern: /^[0-9]+$/,
                  message: "Giá trị phải là số nguyên dương"
                },
                {
                  validator: (_, value) =>
                    value && value.toString().length > 10
                      ? Promise.reject("Giá trị không được vượt quá 10 số")
                      : Promise.resolve()
                }
              ]}
              initialValue={1}
            >
              <InputNumber
                style={{
                  width: "100%"
                }}
              />
            </Form.Item>
          </Col>

          <Col span={24}>
            <Form.Item>
              <Space
                style={{
                  width: "100%",
                  justifyContent: "flex-end"
                }}
              >
                <Button
                  type="default"
                  htmlType="reset"
                  icon={<RetweetOutlined />}
                  //   onClick={() => {
                  //     resetData();
                  //   }}
                >
                  Xóa
                </Button>
                <Button
                  type="primary"
                  htmlType="submit"
                  icon={<CheckCircleOutlined />}
                  style={{
                    float: "right"
                  }}
                >
                  Lưu thao tác
                </Button>
              </Space>
            </Form.Item>
          </Col>

          <Divider />
          <Col span={24}>
            <Space
              style={{
                marginBottom: 16
              }}
              wrap
            >
              <Popconfirm
                title="Bạn có chắc chắn không ?"
                okText="Có"
                cancelText="Không"
                disabled={!(selectedRowKeys.length > 0)}
                //   onConfirm={async () => {
                //     try {
                //       const result = await deleteEvaluationsSupervisor({
                //         idEvaluationsSupervisor: selectedRowKeys as string[]
                //       }).unwrap();
                //       if (result.success) {
                //         resetData();
                //         return setSelectedRowKeys([]);
                //       }
                //     } catch (e: any) {
                //       await HandleError(e);
                //     }
                //   }}
              >
                <Button
                  danger
                  type="primary"
                  //loading={LoadingDeleleBankAccountInformation}
                  disabled={!(selectedRowKeys.length > 0)}
                  icon={<DeleteOutlined />}
                >
                  Xóa {selectedRowKeys.length} mục
                </Button>
              </Popconfirm>
            </Space>

            <Table {...propsTable} expandIconColumnIndex={1} />
          </Col>
        </Row>
      </Form>
    </Spin>
  );
};

export default AddSupervisorToEvaluation;
