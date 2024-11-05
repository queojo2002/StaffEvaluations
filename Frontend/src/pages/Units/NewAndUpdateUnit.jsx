import React, { useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Row, Space, Spin, TreeSelect } from "antd";
import TextArea from "antd/es/input/TextArea";

import { renderTreeUnit } from "./Units";

import { insertListUnit } from "~/apis";
const NewAndUpdateUnit = (props) => {
  const { listUnit, refetchApiUnit, closeModal } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const onFinish = async (values) => {
    setLoading(true);
    const insert = await insertListUnit(values);
    if (insert.isSuccess) {
      formRef.resetFields();
      refetchApiUnit();
      closeModal(false);
    }
    setLoading(false);
  };

  return (
    <div className="NewAndUpdateUnit">
      <Divider />
      <Spin spinning={loading}>
        <Row>
          <Col xs={24} sm={24} md={24} lg={24} xl={24}>
            <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
              <Form.Item
                label="Tên phòng ban (Mỗi dòng là 1 dữ liệu)"
                name={"unitName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên phòng ban"
                  }
                ]}
              >
                <TextArea rows={10} placeholder={"Đơn vị 1\nĐơn vị 2\nĐơn vị 3\nĐơn vị 4\n...."} />
              </Form.Item>

              <Form.Item name={"parentId"} label="Chọn phòng ban cha (Nếu là đơn vị cha thì không cần chọn ở đây)">
                <TreeSelect
                  placeholder={"Chọn phòng ban cha"}
                  showSearch
                  treeNodeFilterProp={"title"}
                  maxTagCount={"responsive"}
                  treeLine={true}
                  treeData={renderTreeUnit(listUnit)}
                  style={{ height: 40 }}
                />
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

export default NewAndUpdateUnit;
