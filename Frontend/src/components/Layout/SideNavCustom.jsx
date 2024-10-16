import { useLocation } from "react-router-dom";
import { Button, Menu } from "antd";

import logo from "../../assets/images/logo.png";
import DATA_MENU from "../../utils/menuData";

const createRoutes = (menuItems) => {
  return menuItems.map((item) => {
    if (item.children) {
      return createRoutes(item.children);
    }
    if (item.label.props) {
      return <Route key={item.key} path={item.label.props.to} element={item.components} />;
    }
  });
};

const SideNavCustom = ({ color }) => {
  const location = useLocation();

  const getSelectedKey = () => {
    const path = location.pathname.split("/").pop();

    const isSubMenu = DATA_MENU.some((item) => item.children?.some((child) => child.key === path));

    return isSubMenu ? path : path === "" ? "dashboard" : path;
  };
  const dashboard = [
    <svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" key={0}>
      <path
        d="M3 4C3 3.44772 3.44772 3 4 3H16C16.5523 3 17 3.44772 17 4V6C17 6.55228 16.5523 7 16 7H4C3.44772 7 3 6.55228 3 6V4Z"
        fill={color}
      ></path>
      <path
        d="M3 10C3 9.44771 3.44772 9 4 9H10C10.5523 9 11 9.44771 11 10V16C11 16.5523 10.5523 17 10 17H4C3.44772 17 3 16.5523 3 16V10Z"
        fill={color}
      ></path>
      <path
        d="M14 9C13.4477 9 13 9.44771 13 10V16C13 16.5523 13.4477 17 14 17H16C16.5523 17 17 16.5523 17 16V10C17 9.44771 16.5523 9 16 9H14Z"
        fill={color}
      ></path>
    </svg>
  ];

  return (
    <>
      <div
        className="brand"
        style={{
          textAlign: "center"
        }}
      >
        <img
          src={logo}
          alt=""
          style={{
            width: "150px",
            height: "110px",
            objectFit: "contain",
            paddingRight: 15,
            marginTop: -20
          }}
        />
        <br />
        <span>Quản lý đánh giá cán bộ</span>
      </div>
      <hr />

      <Menu defaultSelectedKeys={"dashboard"} mode="inline" selectedKeys={[getSelectedKey()]} items={DATA_MENU} />

      <div className="aside-footer">
        <div
          className="footer-box"
          style={{
            background: color
          }}
        >
          <span className="icon" style={{ color }}>
            {dashboard}
          </span>
          <h6>Need Help?</h6>
          <p>Please check our docs</p>
          <Button type="primary" className="ant-btn-sm ant-btn-block">
            DOCUMENTATION
          </Button>
        </div>
      </div>
    </>
  );
};

export default SideNavCustom;
