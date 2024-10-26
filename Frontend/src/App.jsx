import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { BrowserRouter, Navigate, NavLink, Route, Routes } from "react-router-dom";
import { Spin } from "antd";

import { getListMenuOfUser } from "./apis/index.jsx";
import Main from "./components/Layout/Main.jsx";
import SignIn from "./pages/SignIn/index.jsx";
import { setMenuInfo } from "./redux/menuSlice.js"; // Đảm bảo import đúng action
import arrayToTree from "./utils/arrayToTree.js";
import { componentsMapping, iconMapping } from "./utils/mapping.jsx";

import "antd/dist/reset.css";
import "./assets/styles/main.css";
import "./assets/styles/responsive.css";
import "./index.css";

const App = () => {
  const isLoggedIn = useSelector((state) => state.auth.isLoggedIn);
  const dispatch = useDispatch();

  const [loading, setLoading] = useState(true);
  const [menu, setMenu] = useState([]);

  const fetchApiListMenu = async () => {
    setLoading(true);
    const menus = await getListMenuOfUser();
    if (menus?.dataList && menus?.isSuccess) {
      setMenu(renderTreeMenu(arrayToTree(menus.dataList)));
      dispatch(setMenuInfo(menus.dataList));
    }
    setLoading(false);
  };

  useEffect(() => {
    if (isLoggedIn) {
      fetchApiListMenu();
    } else {
      setLoading(false);
    }
  }, [isLoggedIn]);

  return (
    <div className="App">
      <BrowserRouter>
        {isLoggedIn ? (
          <Main>
            {loading ? (
              <Spin spinning={loading} />
            ) : (
              <Routes>
                <Route path="/" element={<Navigate to="/dashboard" replace />} />
                {createRoutes(menu)}
                <Route path="*" element={<Navigate to="/dashboard" replace />} />
              </Routes>
            )}
          </Main>
        ) : (
          <Routes>
            <Route path="/" element={<SignIn />} />
            <Route path="*" element={<Navigate to="/" replace />} />
          </Routes>
        )}
      </BrowserRouter>
    </div>
  );
};

const createRoutes = (menuItems) => {
  return menuItems.map((item) => {
    if (item.children) {
      return createRoutes(item.children);
    }
    if (item.label.props) {
      return <Route key={item.key} path={item.label.props.to} element={item.components} replace />;
    }
    return null;
  });
};

export const renderTreeMenu = (nodes) => {
  return nodes.map((node) => {
    // Lấy IconComponent từ iconMapping nếu có
    const iconComponent = iconMapping[node.icon] || null;

    const componentToRender = componentsMapping[node.key] || null; // Gán component mặc định nếu không tìm thấy

    // Đối tượng nodeData với thông tin cơ bản
    const nodeData = {
      key: node.key,
      name: node.name,
      components: node.components || null // Gán components nếu có
    };

    // Nếu node có children
    if (node.children && node.children.length > 0) {
      // Nếu có children, sử dụng cấu trúc div
      return {
        ...nodeData,
        label: (
          <div className="menu-item-label">
            <span className="label">{node.name}</span>
          </div>
        ),
        children: renderTreeMenu(node.children) // Đệ quy để xử lý children
      };
    } else {
      // Nếu không có children, sử dụng cấu trúc NavLink
      return {
        ...nodeData,
        components: componentToRender,
        label: (
          <NavLink to={node.route || "#"}>
            <span className="icon" style={{}}>
              {iconComponent && iconComponent({ height: "1.5em", width: "1.5em" })}
            </span>
            <span className="menu-items">{node.name}</span>
          </NavLink>
        )
      };
    }
  });
};

export default App;
