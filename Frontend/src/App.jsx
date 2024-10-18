import { useSelector } from "react-redux";
import { BrowserRouter, Navigate, Outlet, Route, Routes } from "react-router-dom";
import { ConfigProvider } from "antd";

import Main from "./components/Layout/Main.jsx";
import SignIn from "./pages/SignIn/index.jsx";
import DATA_MENU from "./utils/menuData";

import "antd/dist/reset.css";
import "./assets/styles/main.css";
import "./assets/styles/responsive.css";
import "./index.css";

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

const App = () => {
  const isLoggedIn = useSelector((state) => state.auth.isLoggedIn);

  return (
    <div className="App">
      <BrowserRouter>
        {isLoggedIn ? (
          <Main>
            <Routes>
              <Route>
                {createRoutes(DATA_MENU)}
                <Route path="*" element={<Navigate to="/dashboard" replace />} />
              </Route>
            </Routes>
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

export default App;
