import { useEffect, useState } from "react";
import { CiPhone } from "react-icons/ci";
import { MdOutlineEmail, MdPersonOutline } from "react-icons/md";
import { PiPasswordThin } from "react-icons/pi";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, DatePicker, Divider, Form, Input, InputNumber, Row, Select, Space, Spin, TreeSelect } from "antd";
import TextArea from "antd/es/input/TextArea";
import dayjs from "dayjs";

import { getUserById, insertUser, updateUser } from "~/apis";
import { renderTreeUnit } from "~/pages/Units/Units";

const NewAndUpdateUser = (props) => {
  const { id, listRole, listUnit, listUserType, refetchApi, closeModal } = props;

  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserById = async (id) => {
    setLoading(true);
    const res = await getUserById(id);
    formRef.setFieldsValue({
      ...res.data,
      birthday: res.data?.birthday ? dayjs(res.data?.birthday) : null
    });
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);
    console.log();

    const res = id
      ? await updateUser({
          ...values,
          birthday: dayjs(values.birthday).format("YYYY-MM-DD")
        })
      : await insertUser({
          ...values,
          birthday: dayjs(values.birthday).format("YYYY-MM-DD")
        });
    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    if (id) {
      fetchUserById(id);
    } else {
      formRef.resetFields();
    }
  }, [id, formRef, refetchApi]);

  return (
    <div className="NewAndUpdateUser">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>
          <Row gutter={16}>
            <Col span={8}>
              <Form.Item
                label="Họ và tên"
                name={"fullName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập họ và tên"
                  }
                ]}
              >
                <Input placeholder={"Họ và tên"} prefix={<MdPersonOutline />} />
              </Form.Item>
            </Col>

            <Col span={8}>
              <Form.Item
                label="Số điện thoại"
                name={"phone"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập số điện thoại"
                  }
                ]}
              >
                <Input style={{ width: "100%" }} placeholder={"Số điện thoại"} prefix={<CiPhone />} />
              </Form.Item>
            </Col>

            <Col span={8}>
              <Form.Item
                label="Ngày sinh"
                name={"birthday"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn ngày sinh"
                  }
                ]}
              >
                <DatePicker format="DD/MM/YYYY" style={{ width: "100%" }} placeholder={"Ngày tháng năm sinh"} />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                label="Email"
                name={"email"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập email"
                  }
                ]}
              >
                <Input placeholder={"Email"} prefix={<MdOutlineEmail />} />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                label="Mật khẩu"
                name={"password"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập mật khẩu"
                  }
                ]}
              >
                <Input type="password" placeholder={"Mật khẩu"} prefix={<PiPasswordThin />} />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item
                label="Địa chỉ"
                name={"address"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập địa chỉ"
                  }
                ]}
              >
                <TextArea rows={5} placeholder={"Địa chỉ...."} />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                name={"unitId"}
                label="Chọn đơn vị"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn đơn vị/phòng ban"
                  }
                ]}
              >
                <TreeSelect
                  placeholder={"Đơn vị/phòng ban"}
                  showSearch
                  treeNodeFilterProp={"title"}
                  maxTagCount={"responsive"}
                  treeLine={true}
                  treeData={renderTreeUnit(listUnit)}
                  style={{ height: 40 }}
                />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                name={"roleId"}
                label="Chọn vai trò"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn vai trò"
                  }
                ]}
              >
                <Select
                  allowClear
                  showSearch
                  style={{ height: 40 }}
                  placeholder={"Vai trò"}
                  options={listRole?.map((item) => ({
                    value: item.id,
                    label: item.roleName
                  }))}
                />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                name={"userTypeId"}
                label="Chọn loại người dùng"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn loại người dùng"
                  }
                ]}
              >
                <Select
                  allowClear
                  showSearch
                  style={{ height: 40 }}
                  placeholder={"Loại người dùng"}
                  options={listUserType?.map((item) => ({
                    value: item.id,
                    label: item.userTypeName
                  }))}
                />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                name={"positionsName"}
                label="Chọn chức danh"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn chức danh"
                  }
                ]}
              >
                <Select
                  allowClear
                  showSearch
                  style={{ height: 40 }}
                  placeholder={"Chức danh"}
                  options={[
                    { value: "VCGV", label: "Viên chức giáo viên" },
                    { value: "VCQL", label: "Viên chức quản lý" },
                    { value: "VCNV", label: "Viên chức nhân viên" },
                    { value: "LDHD", label: "Lao động hợp đồng" }
                  ]}
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
                  <Button type="default" htmlType="reset" loading={loading} icon={<RetweetOutlined />}>
                    Xóa
                  </Button>
                  <Button
                    type="primary"
                    htmlType="submit"
                    loading={loading}
                    icon={<CheckCircleOutlined />}
                    style={{
                      float: "right"
                    }}
                  >
                    Lưu
                  </Button>
                </Space>
              </Form.Item>
            </Col>
          </Row>
        </Form>
      </Spin>
    </div>
  );
};

export default NewAndUpdateUser;
