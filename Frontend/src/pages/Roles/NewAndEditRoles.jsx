import { useEffect, useState } from "react";
import { CheckCircleOutlined, RetweetOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Form, Input, Row, Space, Spin, Tag, TreeSelect } from "antd";

import { getAllMenuItemsByRoleId, insertRoleAndMenuItems, updateRoleAndMenuItems } from "~/apis";
import arrayToTree from "~/utils/arrayToTree";

const renderTreeRoles = (nodes) => {
  return nodes.map((node) => {
    const nodeData = {
      title: <Tag> {node.name}</Tag>,
      id: node.id,
      value: node.id,
      key: node.id,
      name: node.name,
      parentId: node.parentId,
      updatedAt: node.updatedAt
    };

    if (node.children && node.children.length > 0) {
      return {
        ...nodeData,
        children: renderTreeRoles(node.children)
      };
    }
    return nodeData;
  });
};

const NewAndEditRoles = (props) => {
  const { listMenuItems, refetchApi, closeModal, roleId } = props;
  const [formRef] = Form.useForm();
  const [loading, setLoading] = useState(false);

  const fetchMenuItemsByRoleId = async (roleId) => {
    setLoading(true);
    const res = await getAllMenuItemsByRoleId(roleId);
    formRef.setFieldsValue({
      ...res,
      roleId: roleId,
      roleName: res.data?.roleName,
      menuItems: res?.data?.menuItems
    });
    setLoading(false);
  };
  const onFinish = async (values) => {
    setLoading(true);

    const res = roleId ? await updateRoleAndMenuItems(values) : await insertRoleAndMenuItems(values);
    if (res.isSuccess) {
      formRef.resetFields();
      refetchApi();
      closeModal(false);
    }

    setLoading(false);
  };

  useEffect(() => {
    if (roleId) {
      fetchMenuItemsByRoleId(roleId);
    } else {
      formRef.resetFields();
    }
  }, [roleId, formRef, refetchApi]);

  return (
    <div className="AddNewUnit">
      <Divider />
      <Spin spinning={loading}>
        <Row>
          <Col xs={24} sm={24} md={24} lg={24} xl={24}>
            <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
              <Form.Item name={"roleId"} hidden>
                <Input disabled={true} />
              </Form.Item>

              <Form.Item
                label="Tên vai trò"
                name={"roleName"}
                rules={[
                  {
                    required: true,
                    message: "Vui lòng nhập tên phòng ban"
                  }
                ]}
              >
                <Input placeholder={"Tên vai trò"} />
              </Form.Item>

              <Form.Item
                name={"menuItems"}
                label="Chọn các quyền cho vai trò này"
                rules={[
                  {
                    required: true,
                    message: "Vui chọn quyền cho vai trò này"
                  }
                ]}
              >
                <TreeSelect
                  placeholder={"Chọn các quyền cho vai trò này"}
                  showSearch
                  treeNodeFilterProp={"title"}
                  maxTagCount={"responsive"}
                  treeLine={true}
                  treeData={listMenuItems ? renderTreeRoles(arrayToTree(listMenuItems)) : []}
                  style={{ height: 40 }}
                  multiple
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

export default NewAndEditRoles;
