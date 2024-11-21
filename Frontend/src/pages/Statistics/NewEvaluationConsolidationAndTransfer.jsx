import { useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Row, Space, Spin } from "antd";

import { insertEvaluationConsolidationAndTransfer } from "~/apis";

const NewEvaluationConsolidationAndTransfer = (props) => {
  const { refetchApi, closeModal } = props;

  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const onFinish = async (values) => {
    setLoading(true);

    const res = await insertEvaluationConsolidationAndTransfer(values);
    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  return (
    <div className="NewEvaluationConsolidationAndTransfer">
      <Divider />
      <Spin spinning={loading}>
        <Row>
          <Col xs={24} sm={24} md={24} lg={24} xl={24}>
            <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
              <Form.Item
                label="Tên đợt Tổng hợp và chuyển"
                name={"evaluationConsolidationAndTransferName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên đợt Tổng hợp và chuyển"
                  }
                ]}
              >
                <Input placeholder={"Tên đợt Tổng hợp và chuyển"} />
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

export default NewEvaluationConsolidationAndTransfer;
