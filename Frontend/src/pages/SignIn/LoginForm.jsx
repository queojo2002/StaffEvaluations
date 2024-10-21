import React, { useEffect, useState } from "react";
import { BsEye, BsEyeSlash } from "react-icons/bs";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { LockOutlined, UserOutlined } from "@ant-design/icons";
import { Button, Checkbox, Form, Input } from "antd";

import { login } from "../../redux/authSlice.js"; // Đảm bảo import đúng action
import apiInstance from "../../utils/apiInstance.js";
import { BACKEND_API } from "../../utils/constants.js";
import { openNotificationTopLeft } from "../../utils/openNotification.jsx";

const LoginForm = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [form] = Form.useForm();

  const [passwordVisible, setPasswordVisible] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleLogin = async (formValue) => {
    setLoading(true);

    const res = await apiInstance.post(`${BACKEND_API}/api/v1/login`, {
      email: formValue.email,
      password: formValue.password
    });

    if (!res.isSuccess) {
      openNotificationTopLeft("error", "", res.message);
      setLoading(false);
      return;
    }

    const tokenInfo = {
      access_token: res.data?.accessToken,
      refresh_token: res.data?.refreshToken
    };

    dispatch(login(tokenInfo));

    setLoading(false);

    navigate("/dashboard", { replace: true });
  };

  useEffect(() => {
    form.setFieldsValue({ email: "john.doe@sales.com", password: "hashed_password_1" });
  }, []);

  return (
    <Form
      form={form}
      style={{ height: "100%" }}
      onFinish={handleLogin}
      name="loginForm"
      initialValues={{
        remember: true
      }}
    >
      <Form.Item
        name="email"
        rules={[
          {
            required: true,
            message: "Vui lòng nhập địa chỉ email!"
          }
        ]}
      >
        <Input
          className="custom-input"
          size={"large"}
          prefix={<UserOutlined style={{ fontSize: 18 }} />}
          placeholder="Email: admin@gmail.com"
        />
      </Form.Item>

      <Form.Item
        name="password"
        rules={[
          {
            required: true,
            message: "Vui lòng nhập địa chỉ mật khẩu!"
          }
        ]}
      >
        <Input
          type={passwordVisible ? "text" : "password"}
          size={"large"}
          prefix={<LockOutlined style={{ fontSize: 18 }} />}
          suffix={
            passwordVisible ? (
              <BsEye style={{ fontSize: 18, cursor: "pointer" }} onClick={() => setPasswordVisible(false)} />
            ) : (
              <BsEyeSlash style={{ fontSize: 18, cursor: "pointer" }} onClick={() => setPasswordVisible(true)} />
            )
          }
          placeholder="Mật khẩu: admin"
        />
      </Form.Item>

      <Form.Item>
        <Form.Item name="remember" valuePropName="checked" noStyle>
          <Checkbox style={{ float: "left" }}>Ghi nhớ</Checkbox>
        </Form.Item>

        <a style={{ float: "right" }} href="#">
          Quên mật khẩu?
        </a>
      </Form.Item>

      <Form.Item>
        <Button
          loading={loading}
          size={"large"}
          style={{ width: "100%", fontSize: 16 }}
          type="primary"
          htmlType="submit"
        >
          Đăng Nhập
        </Button>
      </Form.Item>
    </Form>
  );
};

export default LoginForm;
