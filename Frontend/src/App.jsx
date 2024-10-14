import { BrowserRouter, Route, Routes } from "react-router-dom";
import { ConfigProvider, Layout } from "antd";

import HeaderCustom from "./components/HeaderCustom";
import SidebarCustom from "./components/SidebarCustom";
import DATA_MENU from "./utils/menuData.jsx";

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
    <ConfigProvider
      theme={{
        token: {
          borderRadius: 2
        }
      }}
    >
      <BrowserRouter>
        <Layout style={{ minHeight: "100vh", fontSize: 16 }}>
          <HeaderCustom />
          <Layout style={{ marginTop: "8vh" }}>
            <SidebarCustom />
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
      </BrowserRouter>
    </ConfigProvider>
  );
};

export default App;
