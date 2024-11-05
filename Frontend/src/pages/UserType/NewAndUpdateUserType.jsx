import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Row, Space, Spin } from "antd";

import { getUserTypeById, insertUserType, updateUserType } from "~/apis";

const NewAndUpdateUserType = (props) => {
  const { refetchApi, closeModal, id } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getUserTypeById(id);
    formRef.setFieldsValue({
      ...res,
      id: id,
      userTypeName: res.data?.userTypeName
    });
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id ? await updateUserType(values) : await insertUserType(values);
    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    if (id) {
      fetchUserTypeById(id);
    } else {
      formRef.resetFields();
    }
  }, [id, formRef, refetchApi]);

  return (
    <div className="AddNewUnit">
      <Divider />
      <Spin spinning={loading}>
        <Row>
          <Col xs={24} sm={24} md={24} lg={24} xl={24}>
            <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
              <Form.Item name={"id"} hidden>
                <Input disabled={true} />
              </Form.Item>

              <Form.Item
                label="Tên loại người dùng"
                name={"userTypeName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên loại người dùng"
                  }
                ]}
              >
                <Input placeholder={"Tên loại người dùng"} />
              </Form.Item>

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
            </Form>
          </Col>
        </Row>
      </Spin>
    </div>
  );
};

export default NewAndUpdateUserType;
