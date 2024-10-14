import React, { useState } from "react";
import Icon, { SearchOutlined } from "@ant-design/icons";
import { Avatar, Badge, Button, Flex, Layout, Space, Typography } from "antd";

import EvaluationLogo from "../../assets/EvaluationLogo.svg?react";

const Header = () => {
  const { Title } = Typography;
  const { Header } = Layout;

  const [isFocused, setIsFocused] = useState(false);

  return (
    <Header
      style={{
        backgroundColor: "#fff",
        height: "8vh",
        position: "fixed",
        width: "100%",
        top: 0,
        left: 0,
        right: 0,
        zIndex: 1000
      }}
    >
      <Flex align="center" justify="space-between">
        <Flex align="center" justify="center" style={{ whiteSpace: "nowrap" }}>
          <Icon component={EvaluationLogo} style={{ fontSize: 56 }} />
          <Title
            style={{
              fontWeight: "bold",
              display: "inline-block",
              color: "#000"
            }}
            level={4}
          >
            EvalEdu
          </Title>
        </Flex>

        <Flex
          align="center"
          justify="center"
          style={{
            marginLeft: 30,
            width: "420px",
            height: "40px",
            padding: "0 16px 0 8px",
            borderRadius: "20px",
            border: "2px solid rgb(232, 232, 232)",
            transition: "border-color .2s ease-in-out",
            borderColor: isFocused ? "black" : "#cbcbcb"
          }}
          onFocus={() => setIsFocused(true)}
          onBlur={() => setIsFocused(false)}
        >
          <SearchOutlined
            style={{
              width: "30px",
              height: "32px",
              opacity: 0.7,
              borderRadius: "50%",
              backgroundSize: "18px",
              transition: "opacity 0.2s ease-in-out",
              backgroundPosition: "50%",
              backgroundRepeat: "no-repeat",
              backgroundColor: "#fff"
            }}
          />
          <input
            style={{
              flex: 1,
              width: "100%",
              height: "100%",
              outline: "none",
              border: "none",
              padding: "0 4px",
              caretColor: "#444"
            }}
            placeholder="Tìm kiếm gì đó...."
          />
        </Flex>

        <Flex
          align="center"
          justify="flex-end"
          style={{
            marginLeft: 0
          }}
        >
          <Space size={20}>
            <Badge size="default" count={5}>
              <Avatar shape="square" size="large" />
            </Badge>
            <Button
              size="large"
              style={{
                background: "transparent",
                fontWeight: 500,
                fontSize: 13,
                borderRadius: 99
              }}
            >
              Đăng ký
            </Button>
            <Button
              size="large"
              style={{
                background: "linear-gradient(to right bottom, #6a82fb, #fc5c7d)",
                borderRadius: 99,
                width: 100,
                color: "#fff",
                flexShrink: 0,
                transitionBehavior: "normal",
                transitionDuration: "0.25s",
                transitionTimingFunction: "ease",
                transitionDelay: 0,
                transitionProperty: "opacity",
                fontSize: 13
              }}
            >
              Đăng nhập
            </Button>
          </Space>
        </Flex>
      </Flex>
    </Header>
  );
};

export default Header;
