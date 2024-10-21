import { useState } from "react";
import { FaGithub } from "react-icons/fa";
import { FaCopyright } from "react-icons/fa";
import { IoLanguageSharp } from "react-icons/io5";
import { Button, Flex, Space, Tabs, Typography } from "antd";

import BackgroundLogin from "../../assets/images/bg.png";
import logoLogin from "../../assets/images/HaNoi.png";

import LoginForm from "./LoginForm";
import LoginPhone from "./LoginPhone";
const SignIn = () => {
  const tabList = [
    {
      key: "loginForm",
      label: "Account Login",
      children: <LoginForm />
    },
    {
      key: "loginPhone",
      label: "Phone Login",
      children: <LoginPhone />
    }
  ];
  const { Title, Paragraph, Text } = Typography;

  return (
    <>
      <Flex
        vertical
        style={{ height: "90vh", backgroundImage: `url(${BackgroundLogin})`, backgroundSize: "100% 100%" }}
      >
        <Flex align="center" justify="flex-end">
          <IoLanguageSharp size={42} style={{ paddingRight: 20, cursor: "pointer" }} />
        </Flex>

        <Flex
          align="center"
          justify="center"
          style={{ paddingRight: 20, paddingLeft: 20, paddingTop: 12, textAlign: "center" }}
        >
          <Space direction="vertical" size={1} style={{ width: "100%", textAlign: "center" }}>
            <img src={logoLogin} width={100} height={100} />
            <Title level={3}>Quản Lý Đánh Giá Cán Bộ</Title>
            <Paragraph italic>
              Hệ thống giúp quản lý và đánh giá năng lực cán bộ, giáo viên một cách hiệu quả, hỗ trợ theo dõi và nâng
              cao chất lượng giáo dục.
            </Paragraph>
          </Space>
        </Flex>

        <Flex
          align="center"
          justify="center"
          style={{ paddingRight: 20, paddingLeft: 20, paddingTop: 12, textAlign: "center" }}
        >
          <Space
            direction="vertical"
            size={1}
            style={{ width: "328px", minWidth: "280px", maxWidth: "75vw", textAlign: "center" }}
          >
            <Tabs centered defaultActiveKey="loginForm" items={tabList} />
          </Space>
        </Flex>
      </Flex>
      <Flex
        align="flex-end"
        justify="center"
        style={{ paddingRight: 20, paddingLeft: 20, paddingTop: 12, textAlign: "center" }}
      >
        <Space direction="vertical" size={1}>
          <Space direction="horizontal">
            <Text>Duc Tran</Text>
            <FaGithub />
            <a
              style={{
                color: "rgba(0, 0, 0, 0.65)",
                textDecoration: "none"
              }}
              href="https://github.com/queojo2002/"
            >
              quejo2002
            </a>
          </Space>
          <Space direction="horizontal">
            <FaCopyright />
            <Text>Powered by Ant Desgin</Text>
          </Space>
        </Space>
      </Flex>
    </>
  );
};

export default SignIn;
