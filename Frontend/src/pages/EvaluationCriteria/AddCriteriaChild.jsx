import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Radio, Row, Select, Space, Spin, Tag, TreeSelect } from "antd";
import TextArea from "antd/es/input/TextArea";

import { renderTreeUnit } from "../Units/Units";

import { renderTreeCriteria } from "./NewAndUpdateEvaluationCriteria";

import { getCategoryCriteriaById, insertCategoryCriteria, updateCategoryCriteria } from "~/apis";

const AddCriteriaChild = (props) => {
  const { refetchApi, closeModal, id, listUnit, listCategoryRating, listCategoryCriteria } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getCategoryCriteriaById(id);
    formRef.setFieldsValue({
      parentId: id,
      unitId: res.data.unitId
    });
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = await insertCategoryCriteria(values);
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
    <div className="AddCriteriaChild">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
          </Form.Item>
          <Form.Item name={"isDistinct"} hidden>
            <Input disabled={true} value={false} />
          </Form.Item>

          <Row gutter={16}>
            <Col span={24}>
              <Form.Item
                label="Nội dung tiêu chí: "
                name={"criteriaName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập nội dung tiêu chí"
                  }
                ]}
              >
                <TextArea autoSize={{ minRows: 5, maxRows: 10 }} />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item name={"parentId"} label="Tiêu chí cha">
                <TreeSelect
                  placeholder={"Chọn tiêu chí cha"}
                  showSearch
                  allowClear
                  style={{ height: 40 }}
                  treeNodeFilterProp={"title"}
                  maxTagCount={"responsive"}
                  treeLine={true}
                  treeData={renderTreeCriteria(listCategoryCriteria)}
                />
              </Form.Item>
            </Col>

            <Col span={12}>
              <Form.Item name={"categoryRatingId"} label="Chọn thang điểm đánh giá">
                <Select
                  allowClear
                  showSearch
                  style={{ height: 40 }}
                  placeholder={"Chọn thang điểm đánh giá"}
                  options={listCategoryRating?.map((item) => ({
                    value: item.id,
                    label: item.ratingName
                  }))}
                />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item name={"unitId"} label="Chọn đơn vị sử dụng">
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

export default AddCriteriaChild;
