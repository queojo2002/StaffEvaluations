import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Radio, Row, Select, Space, Spin, TreeSelect } from "antd";
import TextArea from "antd/es/input/TextArea";

import { renderTreeUnit } from "../Units/Units";

import { getCategoryProsConsById, insertCategoryProsCons, updateCategoryProsCons } from "~/apis";

const NewAndUpdateEvaluationProsCons = (props) => {
  const { refetchApi, closeModal, id } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getCategoryProsConsById(id);
    console.log(res.data);
    formRef.setFieldsValue(res.data);
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id ? await updateCategoryProsCons(values) : await insertCategoryProsCons(values);
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
    <div className="NewAndUpdateEvaluationProsCons">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>

          <Row gutter={16}>
            <Col span={24}>
              <Form.Item
                label="Nội dung: (ưu điểm hoặc nhược điểm)"
                name={"content"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập nội dung"
                  }
                ]}
              >
                <TextArea autoSize={{ minRows: 5, maxRows: 10 }} />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item name={"IsPros"} label="Ưu điểm hay nhược điểm" initialValue={true}>
                <Radio.Group optionType="button">
                  <Radio value={true}>Ưu điểm</Radio>
                  <Radio value={false}>Nhược điểm</Radio>
                </Radio.Group>
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

export default NewAndUpdateEvaluationProsCons;
