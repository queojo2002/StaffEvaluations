import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, InputNumber, Row, Space, Spin } from "antd";
import TextArea from "antd/es/input/TextArea";

import { getCategoryCommentById, insertCategoryComment, updateCategoryComment } from "~/apis";

const NewAndUpdateEvaluationComments = (props) => {
  const { refetchApi, closeModal, id } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getCategoryCommentById(id);
    console.log(res.data);
    formRef.setFieldsValue(res.data);
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id ? await updateCategoryComment(values) : await insertCategoryComment(values);
    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    console.log(id);
    if (id) {
      fetchUserTypeById(id);
    } else {
      formRef.resetFields();
    }
  }, [id, formRef, refetchApi]);

  return (
    <div className="NewAndUpdateEvaluationComments">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>

          <Row gutter={16}>
            <Col span={24}>
              <Form.Item
                label="Tiêu đề nhận xét: "
                name={"title"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tiêu đề nhận xét"
                  }
                ]}
              >
                <TextArea autoSize={{ minRows: 2, maxRows: 5 }} />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item
                label="Nội dung:"
                name={"content"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập nội dung"
                  }
                ]}
              >
                <TextArea
                  autoSize={{ minRows: 6, maxRows: 10 }}
                  placeholder={"- Nội dung 1\n- Nội dung 2\n- Nội dung 3\n- Nội dung 4\n...."}
                />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item
                label="Số thứ tự:"
                name={"sort"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập số thứ tự"
                  }
                ]}
              >
                <InputNumber style={{ width: "100%" }} />
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

export default NewAndUpdateEvaluationComments;
