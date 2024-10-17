import { BrowserRouter, Route, Routes } from "react-router-dom";
import { Layout } from "antd";

import Main from "./components/Layout/Main.jsx";
import SignIn from "./pages/SignIn/index.jsx";
import DATA_MENU from "./utils/menuData.jsx";

import "antd/dist/reset.css";
import "./assets/styles/main.css";
import "./assets/styles/responsive.css";
import "./index.css";

const App = () => {
  const { Footer, Content } = Layout;

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

  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route key="sign-in" path="/" element={<SignIn />} />

          {/* <Main>{createRoutes(DATA_MENU)}</Main> */}
        </Routes>
      </BrowserRouter>
    </div>
  );
};

export default App;
