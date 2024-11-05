import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, DatePicker, Divider, Form, Input, Row, Space, Spin, TreeSelect } from "antd";
import dayjs from "dayjs";

import { renderTreeUnit } from "../Units/Units";

import { getCategoryRatingById, getCategoryTimeTypeById, insertCategoryTimeType, updateCategoryTimeType } from "~/apis";

const NewAndUpdateEvaluationPeriods = (props) => {
  const { refetchApi, closeModal, id, listUnit } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getCategoryTimeTypeById(id);
    formRef.setFieldsValue({
      ...res.data,
      fromDate: res.data?.fromDate ? dayjs(res.data?.fromDate) : null,
      toDate: res.data?.toDate ? dayjs(res.data?.toDate) : null
    });
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id
      ? await updateCategoryTimeType({
          ...values,
          fromDate: dayjs(values.fromDate).format("YYYY-MM-DD"),
          toDate: dayjs(values.toDate).format("YYYY-MM-DD")
        })
      : await insertCategoryTimeType({
          ...values,
          fromDate: dayjs(values.fromDate).format("YYYY-MM-DD"),
          toDate: dayjs(values.toDate).format("YYYY-MM-DD")
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
      fetchUserTypeById(id);
    } else {
      formRef.resetFields();
    }
  }, [id, formRef, refetchApi]);

  return (
    <div className="NewAndUpdateEvaluationPeriods">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>

          <Row gutter={16}>
            <Col span={24}>
              <Form.Item
                label="Tên kỳ đánh giá"
                name={"timeTypeName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên kỳ đánh giá"
                  }
                ]}
              >
                <Input placeholder={"Tên kỳ đánh giá"} />
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
                <DatePicker format="DD/MM/YYYY" placeholder="00/00/0000" style={{ width: "100%" }} />
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
                <DatePicker format="DD/MM/YYYY" placeholder="00/00/0000" style={{ width: "100%" }} />
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

export default NewAndUpdateEvaluationPeriods;
