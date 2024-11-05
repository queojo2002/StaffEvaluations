import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Row, Select, Space, Spin, TreeSelect } from "antd";

import { getEvaluationById, updateEvaluation } from "~/apis";
import { renderTreeUnit } from "~/pages/Units/Units";

const EditEvaluation = (props) => {
  const { refetchApi, closeModal, id, listUnit, listCategoryTimeType } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getEvaluationById(id);
    formRef.setFieldsValue(res.data);
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = await updateEvaluation(values);

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
    <div className="EditEvaluation">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>

          <Row gutter={16}>
            <Col span={24}>
              <Form.Item
                label="Tên phiếu đánh giá: "
                name={"evaluationName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên phiếu đánh giá"
                  }
                ]}
              >
                <Input />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item
                name={"categoryTimeTypeId"}
                label="Chọn kỳ đánh giá"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn kỳ đánh giá"
                  }
                ]}
              >
                <Select
                  allowClear
                  showSearch
                  placeholder={"Chọn kỳ đánh giá"}
                  options={listCategoryTimeType?.map((item) => ({
                    value: item.id,
                    label: item.timeTypeName,
                    fromDate: item.fromDate,
                    toDate: item.toDate
                  }))}
                />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item
                name={"unitId"}
                label="Chọn các đơn vị cần áp dụng"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn đơn vị cần áp dụng"
                  }
                ]}
              >
                <TreeSelect
                  placeholder={"Chọn đơn vị sử dùng"}
                  showSearch
                  treeLine={true}
                  treeData={renderTreeUnit(listUnit)}
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

export default EditEvaluation;
