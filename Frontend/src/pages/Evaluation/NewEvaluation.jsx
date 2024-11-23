import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Row, Select, Space, Spin, Switch, TreeSelect } from "antd";

import { insertEvaluation } from "~/apis";
import { renderTreeUnit } from "~/pages/Units/Units";

const NewEvaluation = (props) => {
  const { refetchApi, closeModal, listUnit, evaluationSampleList } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [copy, setIsCopy] = useState(false);

  const onFinish = async (values) => {
    setLoading(true);

    console.log(values);

    const res = await insertEvaluation(values);
    if (res.isSuccess) {
      formRef.resetFields();
      setIsCopy(false);
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    formRef.resetFields();
  }, []);

  return (
    <div className="NewEvaluation">
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
                name={"listUnitId"}
                label="Chọn các đơn vị cần áp dụng (có thể chọn nhiều)"
                rules={[
                  {
                    required: true,
                    message: "Vui lòng chọn các đơn vị cần áp dụng"
                  }
                ]}
              >
                <TreeSelect
                  placeholder={"Chọn đơn vị sử dùng"}
                  showSearch
                  treeLine={true}
                  treeData={renderTreeUnit(listUnit)}
                  multiple
                />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item name="isCopy" label="Thêm mới theo mẫu phiếu có sẵn?" valuePropName="checked">
                <Switch
                  checkedChildren={"Có"}
                  unCheckedChildren={"Không"}
                  onChange={(checked) => {
                    setIsCopy(checked);
                  }}
                />
              </Form.Item>
            </Col>

            <Col span={24}>
              <Form.Item
                hidden={!copy}
                name={"evaluationSampleId"}
                label="Chọn mẫu phiếu"
                rules={
                  copy
                    ? [
                        {
                          required: true,
                          message: "Vui lòng chọn mẫu phiếu"
                        }
                      ]
                    : null
                }
              >
                <Select
                  allowClear
                  showSearch
                  style={{ height: 40, width: "100%" }}
                  placeholder={"Mẫu phiếu"}
                  options={evaluationSampleList?.map((item) => ({
                    value: item.id,
                    label: item.evaluationSampleName
                  }))}
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

export default NewEvaluation;
