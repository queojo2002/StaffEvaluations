import { BrowserRouter, Route, Routes } from "react-router-dom";
import { Layout } from "antd";

import Main from "./components/Layout/Main.jsx";
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
        <Main>
          <Routes>{createRoutes(DATA_MENU)}</Routes>
        </Main>
      </BrowserRouter>
      {/* <BrowserRouter>
        <Layout style={{ minHeight: "100vh", fontSize: 16 }}>
          <HeaderCustom />
          <Layout style={{ marginTop: "8vh" }}>
            <SideNav color={"#1890ff"} />
            <Content
              style={{
                marginLeft: "15%",
                minHeight: "calc(100vh - 8vh)",
                padding: "16px",
                overflowY: "auto"
              }}
            >
              <Routes>{createRoutes(DATA_MENU)}</Routes>
            </Content>
          </Layout>
          <Footer style={{ backgroundColor: "#ffe58f", height: "2vh", marginLeft: "15%", padding: 0 }}>
            zanduc {`<3`}
          </Footer>
        </Layout>
      </BrowserRouter> */}
    </div>
  );
};

export default App;
