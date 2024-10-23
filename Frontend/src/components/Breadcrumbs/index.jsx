import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { useLocation } from "react-router-dom";
import { animateScroll as scroll } from "react-scroll";
import { Breadcrumb, Typography } from "antd";

import { renderTreeMenu } from "../../App";
import arrayToTree from "../../utils/arrayToTree";

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
  const menu = useSelector((state) => state.menu.menuInfo);
  const [titleName, setTitleName] = useState("");
  const [breadcrumbItems, setBreadcrumbItems] = useState([]);

  const crumbs = (menuData) => {
    const path = location.pathname.split("/");

    console.log(path);

    const listPath = path
      .filter((p) => p !== "")
      .map((p) => ({
        title: findRouteName(p, menuData) || "Không tìm thấy"
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
    if (menu !== null) {
      crumbs(renderTreeMenu(arrayToTree(menu)));
    }
  }, [location, menu]);

  return (
    <>
      <Title level={3}>{titleName}</Title>
      <Breadcrumb style={{ margin: "16px 0px" }} items={breadcrumbItems} />
    </>
  );
};

export default Breadcrumbs;
