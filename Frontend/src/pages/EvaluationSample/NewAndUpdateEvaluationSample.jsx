import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Row, Space, Spin, Tag, TreeSelect } from "antd";

import {
  getAllMenuItemsByRoleId,
  getEvaluationSampleById,
  insertEvaluationSample,
  insertRoleAndMenuItems,
  updateEvaluationSample,
  updateRoleAndMenuItems
} from "~/apis";
import arrayToTree from "~/utils/arrayToTree";

const NewAndUpdateEvaluationSample = (props) => {
  const { refetchApi, closeModal, id } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchById = async (id) => {
    setLoading(true);
    const res = await getEvaluationSampleById(id);
    formRef.setFieldsValue({
      ...res,
      id: id,
      evaluationSampleName: res.data?.evaluationSampleName
    });
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id ? await updateEvaluationSample(values) : await insertEvaluationSample(values);
    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    if (id) {
      fetchById(id);
    } else {
      formRef.resetFields();
    }
  }, [id, formRef, refetchApi]);

  return (
    <div className="NewAndUpdateEvaluationSample">
      <Divider />
      <Spin spinning={loading}>
        <Row>
          <Col xs={24} sm={24} md={24} lg={24} xl={24}>
            <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
              <Form.Item name={"id"} hidden>
                <Input disabled={true} />
              </Form.Item>

              <Form.Item
                label="Tên mẫu phiếu đánh giá"
                name={"evaluationSampleName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên mẫu phiếu đánh giá"
                  }
                ]}
              >
                <Input placeholder={"Tên mẫu phiếu đánh giá"} />
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

export default NewAndUpdateEvaluationSample;
