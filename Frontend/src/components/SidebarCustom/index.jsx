import React from "react";
import { useLocation } from "react-router-dom";
import { Layout, Menu } from "antd";

import DATA_MENU from "../../utils/menuData.jsx";

const SidebarCustom = () => {
  const { Sider } = Layout;

  const location = useLocation();

  const getSelectedKey = () => {
    const path = location.pathname.split("/").pop();

    const isSubMenu = DATA_MENU.some((item) => item.children?.some((child) => child.key === path));

    return isSubMenu ? path : path === "" ? "dashboard" : path;
  };

  return (
    <Sider
      width="15%"
      style={{
        backgroundColor: "#fff",
        height: "calc(100vh - 8vh)",
        position: "fixed",
        left: 0,
        zIndex: 500,
        overflowY: "auto",
        margin: 0,
        scrollbarWidth: "none",
        paddingTop: "2vh"
      }}
    >
      <Menu
        defaultSelectedKeys={"dashboard"}
        mode="inline"
        selectedKeys={[getSelectedKey()]}
        style={{ height: "100%", width: "100%" }}
        items={DATA_MENU}
      />
    </Sider>
  );
};

export default SidebarCustom;
