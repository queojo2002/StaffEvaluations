import React, { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import { animateScroll as scroll } from "react-scroll";
import { Breadcrumb, Typography } from "antd";

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
  const { Title } = Typography;
  const location = useLocation();
  const [titleName, setTitleName] = useState("");
  const [breadcrumbItems, setBreadcrumbItems] = useState([]);

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

    const last = listPath[listPath.length - 1];

    document.title = last.title;

    scroll.scrollToTop({ duration: 500 });

    setTitleName(last.title);

    setBreadcrumbItems(listPath);
  };

  useEffect(() => {
    crumbs();
  }, [location]);

  return (
    <>
      <Title level={3}>{titleName}</Title>
      <Breadcrumb style={{ margin: "16px 0px" }} items={breadcrumbItems} />
    </>
  );
};

export default Breadcrumbs;
