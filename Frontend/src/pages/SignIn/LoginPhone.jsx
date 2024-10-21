import React from "react";
import { IoIosPhonePortrait } from "react-icons/io";
import { LockOutlined, UserOutlined } from "@ant-design/icons";
import { Button, Checkbox, Flex, Form, Input } from "antd";

const LoginPhone = () => {
  return (
    <Form
      style={{ height: "100%" }}
      name="loginPhone"
      initialValues={{
        remember: true
      }}
    >
      <Form.Item
        name="phoneNumber"
        rules={[
          {
            required: true,
            message: "Vui lòng nhập số điện thoại!"
          }
        ]}
      >
        <Input size={"large"} prefix={<IoIosPhonePortrait style={{ fontSize: 18 }} />} placeholder="Số điện thoại" />
      </Form.Item>

      <Flex align="center" style={{ width: "100%" }}>
        <Form.Item
          name="code"
          style={{ flex: "1 1 0%", marginRight: "8px" }}
          rules={[
            {
              required: true,
              message: "Vui lòng nhập mã xác minh!"
            }
          ]}
        >
          <Input size="large" prefix={<LockOutlined style={{ fontSize: 18 }} />} placeholder="Mã xác minh" />
        </Form.Item>
        <Form.Item>
          <Button
            size="large"
            style={{ minWidth: "120px", fontSize: 16, fontWeight: 400 }}
            color="default"
            variant="outlined"
          >
            Get Code
          </Button>
        </Form.Item>
      </Flex>

      <Form.Item>
        <Form.Item name="remember" valuePropName="checked" noStyle>
          <Checkbox style={{ float: "left" }}>Ghi nhớ</Checkbox>
        </Form.Item>

        <a style={{ float: "right" }} href="#">
          Quên mật khẩu?
        </a>
      </Form.Item>

      <Form.Item>
        <Button size={"large"} style={{ width: "100%", fontSize: 16 }} type="primary" htmlType="submit">
          Đăng Nhập
        </Button>
      </Form.Item>
    </Form>
  );
};

export default LoginPhone;
