import React from "react";
import { Link } from "react-router-dom";
import { DribbbleOutlined, GithubOutlined, InstagramOutlined, TwitterOutlined } from "@ant-design/icons";
import { Button, Card, Checkbox, Form, Input, Layout, Menu, Typography } from "antd";

import logo3 from "../../assets/images/Google__G__Logo.svg.png";
import logo2 from "../../assets/images/logo-apple.svg";
import logo1 from "../../assets/images/logos-facebook.svg";

const { Title } = Typography;
const { Header, Footer, Content } = Layout;

const template = [
  <svg data-v-4ebdc598="" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path
      data-v-4ebdc598=""
      d="M3 4C3 3.44772 3.44772 3 4 3H16C16.5523 3 17 3.44772 17 4V6C17 6.55228 16.5523 7 16 7H4C3.44772 7 3 6.55228 3 6V4Z"
      fill="#111827"
      className="fill-muted"
    ></path>
    <path
      data-v-4ebdc598=""
      d="M3 10C3 9.44771 3.44772 9 4 9H10C10.5523 9 11 9.44771 11 10V16C11 16.5523 10.5523 17 10 17H4C3.44772 17 3 16.5523 3 16V10Z"
      fill="#111827"
      className="fill-muted"
    ></path>
    <path
      data-v-4ebdc598=""
      d="M14 9C13.4477 9 13 9.44771 13 10V16C13 16.5523 13.4477 17 14 17H16C16.5523 17 17 16.5523 17 16V10C17 9.44771 16.5523 9 16 9H14Z"
      fill="#111827"
      className="fill-muted"
    ></path>
  </svg>
];

const profile = [
  <svg data-v-4ebdc598="" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path
      data-v-4ebdc598=""
      fillRule="evenodd"
      clipRule="evenodd"
      d="M18 10C18 14.4183 14.4183 18 10 18C5.58172 18 2 14.4183 2 10C2 5.58172 5.58172 2 10 2C14.4183 2 18 5.58172 18 10ZM12 7C12 8.10457 11.1046 9 10 9C8.89543 9 8 8.10457 8 7C8 5.89543 8.89543 5 10 5C11.1046 5 12 5.89543 12 7ZM9.99993 11C7.98239 11 6.24394 12.195 5.45374 13.9157C6.55403 15.192 8.18265 16 9.99998 16C11.8173 16 13.4459 15.1921 14.5462 13.9158C13.756 12.195 12.0175 11 9.99993 11Z"
      fill="#111827"
      className="fill-muted"
    ></path>
  </svg>
];

const signup = [
  <svg data-v-4ebdc598="" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path
      data-v-4ebdc598=""
      fillRule="evenodd"
      clipRule="evenodd"
      d="M6 2C5.44772 2 5 2.44772 5 3V4H4C2.89543 4 2 4.89543 2 6V16C2 17.1046 2.89543 18 4 18H16C17.1046 18 18 17.1046 18 16V6C18 4.89543 17.1046 4 16 4H15V3C15 2.44772 14.5523 2 14 2C13.4477 2 13 2.44772 13 3V4H7V3C7 2.44772 6.55228 2 6 2ZM6 7C5.44772 7 5 7.44772 5 8C5 8.55228 5.44772 9 6 9H14C14.5523 9 15 8.55228 15 8C15 7.44772 14.5523 7 14 7H6Z"
      fill="#111827"
      className="fill-muted"
    ></path>
  </svg>
];

const signin = [
  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14">
    <path
      className="fill-muted"
      d="M12.25,14H1.75A1.752,1.752,0,0,1,0,12.25V3.5A1.752,1.752,0,0,1,1.75,1.75h.876V.875a.875.875,0,0,1,1.75,0V1.75h5.25V.875a.875.875,0,0,1,1.75,0V1.75h.875A1.752,1.752,0,0,1,14,3.5v8.75A1.752,1.752,0,0,1,12.25,14ZM3.5,4.375a.875.875,0,0,0,0,1.75h7a.875.875,0,0,0,0-1.75Z"
    />
  </svg>
];

const SignIn = () => {
  const onFinish = (values) => {
    console.log("Success:", values);
  };

  const onFinishFailed = (errorInfo) => {
    console.log("Failed:", errorInfo);
  };

  const menuItems = [
    { label: "Company", key: "company" },
    { label: "About Us", key: "about" },
    { label: "Teams", key: "teams" },
    { label: "Products", key: "products" },
    { label: "Blogs", key: "blogs" },
    { label: "Pricing", key: "pricing" }
  ];

  const socialItems = [
    { icon: <DribbbleOutlined width={18} height={18} />, key: "dribbble" },
    { icon: <TwitterOutlined width={18} height={18} />, key: "twitter" },
    { icon: <InstagramOutlined width={18} height={18} />, key: "instagram" },
    { icon: <GithubOutlined width={18} height={18} />, key: "github" }
  ];

  return (
    <>
      <div className="layout-default ant-layout layout-sign-up">
        <Header>
          <div className="header-col header-brand"></div>
          <div className="header-col header-nav"></div>
        </Header>

        <Content className="p-0">
          <div className="sign-up-header">
            <div className="content">
              <Title>Đăng Nhập</Title>
              <p className="text-lg">Chào mừng bạn đến với hệ thống quản lý đánh giá cán bộ.</p>
            </div>
          </div>

          <Card
            className="card-signup header-solid h-full ant-card pt-0"
            title={<h5>Đăng nhập với</h5>}
            bordered="false"
          >
            <div className="sign-up-gateways">
              <Button type="default">
                <img src={logo1} alt="logo 1" width={20} height={20} />
              </Button>
              <Button type="default">
                <img src={logo2} alt="logo 2" width={20} height={20} />
              </Button>
              <Button type="default">
                <img src={logo3} alt="logo 3" width={20} height={20} />
              </Button>
            </div>
            <p className="text-center my-25 font-semibold text-muted">Hoặc</p>
            <Form
              name="basic"
              initialValues={{ remember: true }}
              onFinish={onFinish}
              onFinishFailed={onFinishFailed}
              className="row-col"
            >
              <Form.Item name="email" rules={[{ required: true, message: "Please input your email!" }]}>
                <Input placeholder="Địa chỉ email" />
              </Form.Item>
              <Form.Item name="password" rules={[{ required: true, message: "Please input your password!" }]}>
                <Input placeholder="Mật khẩu" />
              </Form.Item>

              {/* <Form.Item name="remember" valuePropName="checked">
                <Checkbox>
                  I agree the{" "}
                  <a href="#pablo" className="font-bold text-dark">
                    Terms and Conditions
                  </a>
                </Checkbox>
              </Form.Item> */}

              <Form.Item>
                <Button style={{ width: "100%" }} type="primary" htmlType="submit">
                  ĐĂNG NHẬP
                </Button>
              </Form.Item>
            </Form>
            {/* <p className="font-semibold text-muted text-center">
              Already have an account?{" "}
              <Link to="/sign-in" className="font-bold text-dark">
                Sign In
              </Link>
            </p> */}
          </Card>
        </Content>
        <Footer>
          <Menu mode="horizontal" items={menuItems} />

          <Menu
            mode="horizontal"
            className="menu-nav-social"
            items={socialItems.map((item) => ({
              label: <Link to="#">{item.icon}</Link>,
              key: item.key
            }))}
          />

          <p className="copyright">
            {" "}
            Copyright © 2024 by<a href="https://github.com/queojo2002">queojo2002</a>.
          </p>
        </Footer>
      </div>
    </>
  );
};

export default SignIn;
