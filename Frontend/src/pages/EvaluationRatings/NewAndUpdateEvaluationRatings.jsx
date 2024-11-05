import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, InputNumber, Row, Space, Spin, TreeSelect } from "antd";

import { renderTreeUnit } from "../Units/Units";

import { getCategoryRatingById, insertCategoryRating, updateCategoryRating } from "~/apis";

const NewAndUpdateEvaluationRatings = (props) => {
  const { refetchApi, closeModal, id, listUnit } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getCategoryRatingById(id);
    formRef.setFieldsValue(res.data);
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id ? await updateCategoryRating(values) : await insertCategoryRating(values);
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
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>

          <Row gutter={16}>
            <Col span={24}>
              <Form.Item
                label="Tên thang điểm đánh giá"
                name={"ratingName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập thang điểm đánh giá"
                  }
                ]}
              >
                <Input placeholder={"Tên thang điểm đánh giá"} />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                label="Số điểm tối thiểu"
                name={"startValue"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập số điểm tối thiểu"
                  }
                ]}
              >
                <InputNumber style={{ width: "100%" }} placeholder={"0"} />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                label="Số điểm tối đa"
                name={"endValue"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập số điểm tối đa"
                  },
                  ({ getFieldValue }) => ({
                    validator(_, value) {
                      if (!value || getFieldValue("startValue") <= value) {
                        return Promise.resolve();
                      }
                      return Promise.reject(new Error("Số điểm tối đa phải lớn hơn hoặc bằng số điểm tối thiểu"));
                    }
                  })
                ]}
              >
                <InputNumber style={{ width: "100%" }} placeholder={"0"} />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item name={"unitId"} label="Chọn đơn vị sử dùng">
                <TreeSelect
                  placeholder={"Chọn đơn vị sử dùng"}
                  showSearch
                  treeNodeFilterProp={"title"}
                  maxTagCount={"responsive"}
                  treeLine={true}
                  treeData={renderTreeUnit(listUnit)}
                  style={{ height: 40 }}
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

export default NewAndUpdateEvaluationRatings;
