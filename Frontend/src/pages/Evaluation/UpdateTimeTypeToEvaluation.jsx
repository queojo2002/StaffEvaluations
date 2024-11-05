import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, DatePicker, Divider, Form, Input, Row, Select, Space, Spin } from "antd";
import moment from "moment";

import { updateListEvaluation } from "~/apis";

const UpdateTimeTypeToEvaluation = (props) => {
  const { refetchApi, closeModal, evaluationIds, listCategoryTimeType, setSelectedRowKeys } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const onFinish = async (values) => {
    setLoading(true);

    const res = await updateListEvaluation({
      evaluationIds: evaluationIds,
      categoryTimeTypeId: values.categoryTimeTypeId
    });

    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
      setSelectedRowKeys([]);
    }

    setLoading(false);
  };

  useEffect(() => {
    formRef.resetFields();
  }, []);

  return (
    <div className="UpdateTimeTypeToEvaluation">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>

          <Row gutter={16}>
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
                  onChange={(value, option) => {
                    formRef.setFieldsValue({
                      fromDate: option.fromDate ? moment(option.fromDate, "YYYY-MM-DD") : null,
                      toDate: option.toDate ? moment(option.toDate, "YYYY-MM-DD") : null
                    });
                  }}
                />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                name={"fromDate"}
                label="Ngày bắt đầu đánh giá"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn ngày bắt đầu đánh giá"
                  }
                ]}
              >
                <DatePicker format="DD/MM/YYYY" placeholder="00/00/0000" style={{ width: "100%" }} disabled />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item
                name={"toDate"}
                label="Ngày kết thúc đánh giá"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn ngày kết thúc đánh giá"
                  }
                ]}
              >
                <DatePicker format="DD/MM/YYYY" placeholder="00/00/0000" style={{ width: "100%" }} disabled />
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

export default UpdateTimeTypeToEvaluation;
