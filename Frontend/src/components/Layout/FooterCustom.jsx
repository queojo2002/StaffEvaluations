import { HeartFilled } from "@ant-design/icons";
import { Col, Layout, Row } from "antd";

const FooterCustom = () => {
  const { Footer: AntFooter } = Layout;

  return (
    <AntFooter style={{ background: "#fafafa" }}>
      <Row className="just">
        <Col xs={24} md={12} lg={12}>
          <div className="copyright">
            © 2024, made with
            {<HeartFilled />} by
            <a href="https://github.com/queojo2002?tab=repositories" className="font-weight-bold" target="_blank">
              quejo2002
            </a>
            for a better web.
          </div>
        </Col>
      </Row>
    </AntFooter>
  );
};

export default FooterCustom;
