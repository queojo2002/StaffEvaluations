import React, { useEffect } from "react";
import { useLocation } from "react-router-dom";
import { Breadcrumb } from "antd";

import DATA_MENU from "../../utils/menuData";

const findRouteName = (pathname, menu) => {
  for (const item of menu) {
    if (item.key === pathname) {
      return item.name;
    }

    if (item.children) {
      const childRoute = findRouteName(pathname, item.children);
      if (childRoute) return childRoute;
    }
  }
  return null;
};

const Breadcrumbs = () => {
  const location = useLocation();

  const crumbs = () => {
    const path = location.pathname.split("/");

    const listPath = path
      .filter((p) => p !== "")
      .map((p) => ({
        title: findRouteName(p, DATA_MENU) || "Không tìm thấy"
      }));

    listPath.unshift({
      title: "Admin"
    });

    return listPath;
  };

  return <Breadcrumb style={{ margin: "16px 0px" }} items={crumbs()} />;
};

export default Breadcrumbs;
