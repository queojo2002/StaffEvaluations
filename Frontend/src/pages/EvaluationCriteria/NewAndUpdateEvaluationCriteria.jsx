import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Radio, Row, Select, Space, Spin, Tag, TreeSelect } from "antd";
import TextArea from "antd/es/input/TextArea";

import { renderTreeUnit } from "../Units/Units";

import { getCategoryCriteriaById, insertCategoryCriteria, updateCategoryCriteria } from "~/apis";

export const renderTreeCriteria = (nodes) => {
  return nodes.map((node) => {
    const nodeData = {
      title: <Tag> {node.criteriaName}</Tag>,
      id: node.id,
      value: node.id,
      key: node.id,
      criteriaName: node.criteriaName,
      startValue: node.startValue,
      endValue: node.endValue,
      unitName: node.unitName,
      parentId: node.parentId,
      updatedAt: node.updatedAt,
      order: node.order
    };

    if (node.children && node.children.length > 0) {
      return {
        ...nodeData,
        children: renderTreeCriteria(node.children)
      };
    }
    return nodeData;
  });
};

const NewAndUpdateEvaluationCriteria = (props) => {
  const { refetchApi, closeModal, id, listUnit, listCategoryRating, listCategoryCriteria } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchUserTypeById = async (id) => {
    setLoading(true);
    const res = await getCategoryCriteriaById(id);
    console.log(res.data);
    formRef.setFieldsValue(res.data);
    setLoading(false);
  };

  const onFinish = async (values) => {
    setLoading(true);

    const res = id ? await updateCategoryCriteria(values) : await insertCategoryCriteria(values);
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
    <div className="NewAndUpdateEvaluationCriteria">
      <Divider />
      <Spin spinning={loading}>
        <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
          <Form.Item name={"id"} hidden>
            <Input disabled={true} />
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
              <Form.Item name={"isDistinct"} label="Chỉ tính điểm 1 tiêu chí con" initialValue={false}>
                <Radio.Group optionType="button">
                  <Radio value={true}>Bật</Radio>
                  <Radio value={false}>Tắt</Radio>
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

export default NewAndUpdateEvaluationCriteria;
