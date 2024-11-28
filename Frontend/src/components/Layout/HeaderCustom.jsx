import { useEffect, useState } from "react";
import { BiLogOutCircle } from "react-icons/bi";
import { CgProfile } from "react-icons/cg";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { animateScroll as scroll } from "react-scroll";
import {
  BellOutlined,
  ClockCircleOutlined,
  FacebookFilled,
  ReloadOutlined,
  RightCircleOutlined,
  SearchOutlined,
  StarOutlined,
  TwitterOutlined,
  UserOutlined
} from "@ant-design/icons";
import { Avatar, Badge, Button, Col, Drawer, Dropdown, Input, List, Row, Space, Spin, Switch, Typography } from "antd";
import styled from "styled-components";

import { logout, setUserInfo } from "../../redux/authSlice.js";
import apiInstance from "../../utils/apiInstance.js";
import { BACKEND_API } from "../../utils/constants.js";

const ButtonContainer = styled.div`
  .ant-btn-primary {
    background-color: #1890ff;
  }
  .ant-btn-success {
    background-color: #52c41a;
  }
  .ant-btn-yellow {
    background-color: #fadb14;
  }
  .ant-btn-black {
    background-color: #262626;
    color: #fff;
    border: 0px;
    border-radius: 5px;
  }
  .ant-switch-active {
    background-color: #1890ff;
  }
`;

const logsetting = [
  <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" key={0}>
    <path
      fillRule="evenodd"
      clipRule="evenodd"
      d="M11.4892 3.17094C11.1102 1.60969 8.8898 1.60969 8.51078 3.17094C8.26594 4.17949 7.11045 4.65811 6.22416 4.11809C4.85218 3.28212 3.28212 4.85218 4.11809 6.22416C4.65811 7.11045 4.17949 8.26593 3.17094 8.51078C1.60969 8.8898 1.60969 11.1102 3.17094 11.4892C4.17949 11.7341 4.65811 12.8896 4.11809 13.7758C3.28212 15.1478 4.85218 16.7179 6.22417 15.8819C7.11045 15.3419 8.26594 15.8205 8.51078 16.8291C8.8898 18.3903 11.1102 18.3903 11.4892 16.8291C11.7341 15.8205 12.8896 15.3419 13.7758 15.8819C15.1478 16.7179 16.7179 15.1478 15.8819 13.7758C15.3419 12.8896 15.8205 11.7341 16.8291 11.4892C18.3903 11.1102 18.3903 8.8898 16.8291 8.51078C15.8205 8.26593 15.3419 7.11045 15.8819 6.22416C16.7179 4.85218 15.1478 3.28212 13.7758 4.11809C12.8896 4.65811 11.7341 4.17949 11.4892 3.17094ZM10 13C11.6569 13 13 11.6569 13 10C13 8.34315 11.6569 7 10 7C8.34315 7 7 8.34315 7 10C7 11.6569 8.34315 13 10 13Z"
      fill="#111827"
    ></path>
  </svg>
];

const toggler = [
  <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" key={0}>
    <path d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path>
  </svg>
];

const HeaderCustom = ({
  placement,
  name,
  subName,
  onPress,
  handleSidenavColor,
  handleSidenavType,
  handleFixedNavbar
}) => {
  const items = [
    {
      key: "1",
      label: "Tài khoản của tôi",
      icon: <CgProfile />
    },
    {
      type: "divider"
    },
    {
      key: "2",
      label: "Đăng xuất",
      icon: <BiLogOutCircle />,
      onClick: () => handleLogout()
    }
  ];

  const { Title, Text } = Typography;
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const [visible, setVisible] = useState(false);
  const [sidenavType, setSidenavType] = useState("transparent");
  const [loading, setLoading] = useState(false);
  const [user, setUser] = useState(false);
  const [dataNotification, setDataNotification] = useState([
    {
      title: "Phiếu đánh giá sắp đến hạn đánh giá",
      content: "Không có phiếu nào",
      icon: <RightCircleOutlined />,
      link: "/admin/TU_DANH_GIA_TOAN_BO",
      color: "#8d8f06"
    },
    {
      title: "Phiếu đánh giá hiện tại đang trong thời gian mở",
      content: "Không có phiếu nào",
      icon: <ClockCircleOutlined />,
      link: "/admin/TU_DANH_GIA_TOAN_BO",
      color: "red"
    },
    {
      title: "Phiếu đánh giá đang chờ xem xét",
      content: "Không có phiếu nào",
      icon: <ReloadOutlined />,
      link: "/admin/DANH_SACH_CHO_DANH_GIA",
      color: "blue"
    }
  ]);

  useEffect(() => scroll.scrollToTop({ duration: 500 }));

  const showDrawer = () => setVisible(true);
  const hideDrawer = () => setVisible(false);

  const handleLogout = () => {
    setLoading(true);

    setTimeout(() => {
      dispatch(logout());

      setLoading(false);

      navigate("/", { replace: true });
    }, 2000);
  };

  const notificationMenu = (
    <List
      itemLayout="horizontal"
      dataSource={dataNotification}
      style={{
        width: 500,
        borderRadius: "8px",
        boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
        backgroundColor: "#fff"
      }}
      renderItem={(item, index) => (
        <List.Item
          style={{
            marginTop: 10,
            padding: "16px 24px",
            borderBottom: "1px solid #f0f0f0",
            transition: "background 0.3s",
            cursor: "pointer"
          }}
          // onClick={() => handleNavigationNotification(item.link)}
        >
          <List.Item.Meta
            avatar={
              <Avatar
                icon={item.icon}
                style={{
                  backgroundColor: item.color
                }}
              />
            }
            title={
              <Typography
                // onClick={() => handleNavigationNotification(item.link)}
                style={{
                  transition: "color 0.3s, font-weight 0.3s"
                }}
                className="notification-title"
              >
                {item.title}
              </Typography>
            }
            description={item.content}
          />
        </List.Item>
      )}
    />
  );

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const res = await apiInstance.get(`${BACKEND_API}/api/v1/profile`);
      if (res.isSuccess) {
        setUser(res.data);

        dispatch(setUserInfo(res.data));
      }
      setLoading(false);
    };
    fetchData();
  }, []);

  return (
    <>
      <Row gutter={[24, 0]}>
        <Col
          span={24}
          md={6}
          xs={24}
          sm={24}
          style={{
            textAlign: window.innerWidth < 576 ? "center" : ""
          }}
        >
          {/* <div className="ant-page-header-heading">
            <span className="ant-page-header-heading-title" style={{ textTransform: "capitalize" }}>
              {subName.replace("/", "")}
            </span>
          </div> */}
          {/* <Breadcrumb>
            <Breadcrumb.Item>
              <NavLink to="/">Pages</NavLink>
            </Breadcrumb.Item>
            <Breadcrumb.Item style={{ textTransform: "capitalize" }}>{name.replace("/", "")}</Breadcrumb.Item>
          </Breadcrumb> */}
        </Col>
        <Col
          span={24}
          md={18}
          xs={24}
          sm={24}
          className="header-control"
          style={{
            textAlign: window.innerWidth < 576 ? "center" : ""
          }}
        >
          {/* <Badge size="small" count={4}>
            <Dropdown overlay={menu} trigger={["click"]}>
              <a href="#pablo" className="ant-dropdown-link" onClick={(e) => e.preventDefault()}>
                {bell}
              </a>
            </Dropdown>
          </Badge> */}
          <Button type="link" onClick={showDrawer}>
            {logsetting}
          </Button>

          <Drawer
            className="settings-drawer"
            mask={true}
            width={360}
            onClose={hideDrawer}
            placement={placement}
            open={visible}
          >
            <div layout="vertical">
              <div className="header-top">
                <Title level={4}>
                  Configurator
                  <Text className="subtitle">See our dashboard options.</Text>
                </Title>
              </div>

              <div className="sidebar-color">
                <Title level={5}>Sidebar Color</Title>
                <div className="theme-color mb-2">
                  <ButtonContainer>
                    <Button type="primary" onClick={() => handleSidenavColor("#1890ff")}>
                      1
                    </Button>
                    <Button type="success" onClick={() => handleSidenavColor("#52c41a")}>
                      1
                    </Button>
                    <Button danger type="default" onClick={() => handleSidenavColor("#d9363e")}>
                      1
                    </Button>
                    <Button type="yellow" onClick={() => handleSidenavColor("#fadb14")}>
                      1
                    </Button>

                    <Button type="black" onClick={() => handleSidenavColor("#111")}>
                      1
                    </Button>
                  </ButtonContainer>
                </div>

                <div className="sidebarnav-color mb-2">
                  <Title level={5}>Sidenav Type</Title>
                  <Text>Choose between 2 different sidenav types.</Text>
                  <ButtonContainer className="trans">
                    <Button
                      type={sidenavType === "transparent" ? "primary" : "white"}
                      onClick={() => {
                        handleSidenavType("transparent");
                        setSidenavType("transparent");
                      }}
                    >
                      TRANSPARENT
                    </Button>
                    <Button
                      type={sidenavType === "white" ? "primary" : "white"}
                      onClick={() => {
                        handleSidenavType("#fff");
                        setSidenavType("white");
                      }}
                    >
                      WHITE
                    </Button>
                  </ButtonContainer>
                </div>
                <div className="fixed-nav mb-2">
                  <Title level={5}>Navbar Fixed </Title>
                  <Switch onChange={(e) => handleFixedNavbar(e)} />
                </div>
                <div className="ant-docment">
                  <ButtonContainer>
                    <Button type="black" size="large">
                      FREE DOWNLOAD
                    </Button>
                    <Button size="large">VIEW DOCUMENTATION</Button>
                  </ButtonContainer>
                </div>
                <div className="viewstar">
                  <a href="#pablo">{<StarOutlined />} Star</a>
                  <a href="#pablo"> 190</a>
                </div>

                <div className="ant-thank">
                  <Title level={5} className="mb-2">
                    Thank you for sharing!
                  </Title>
                  <ButtonContainer className="social">
                    <Button type="black">{<TwitterOutlined />}TWEET</Button>
                    <Button type="black">{<FacebookFilled />}SHARE</Button>
                  </ButtonContainer>
                </div>
              </div>
            </div>
          </Drawer>

          <Spin spinning={loading}>
            <Dropdown menu={{ items }}>
              <a
                onClick={(e) => e.preventDefault()}
                style={{
                  display: "flex",
                  alignItems: "center",
                  color: "inherit",
                  textDecoration: "none",
                  borderRadius: 6,
                  height: 44,
                  paddingLeft: 10,
                  paddingRight: 10
                }}
                onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = "rgba(0, 0, 0, 0.03)")}
                onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = "transparent")}
              >
                <UserOutlined
                  style={{
                    marginRight: "6px"
                  }}
                />
                <span>{user.fullName}</span>
              </a>
            </Dropdown>
          </Spin>

          <Input
            style={{ height: 35 }}
            className="header-search"
            placeholder="Nhập gì đó..."
            prefix={<SearchOutlined />}
          />

          <Spin spinning={false}>
            <Space style={{ marginRight: 20 }}>
              <Dropdown
                overlay={notificationMenu}
                trigger={["click"]}
                // onVisibleChange={handleVisibleChange}
                // visible={visible}
                placement="bottomCenter" // Hiển thị danh sách ở giữa
              >
                <Badge count={3} offset={[2, 0]}>
                  {" "}
                  <div
                    style={{
                      transform: "scale(1.5)",
                      display: "flex",
                      alignItems: "center",
                      justifyContent: "center",
                      cursor: "pointer" // Hiển thị con trỏ dạng click khi hover
                    }}
                  >
                    <BellOutlined style={{ fontSize: "24px" }} />
                  </div>
                </Badge>
              </Dropdown>
            </Space>
          </Spin>

          <Button type="link" className="sidebar-toggler" onClick={() => onPress()}>
            {toggler}
          </Button>
        </Col>
      </Row>
    </>
  );
};

export default HeaderCustom;
