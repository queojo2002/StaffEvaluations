import { InboxOutlined } from "@ant-design/icons";
import { Col, Row } from "antd";
import Dragger from "antd/es/upload/Dragger";
const EvaluationSubmissionConfirmation = (props) => {
  const { setFile } = props;
  return (
    <Row gutter={16}>
      <Col span={24}>
        <Dragger
          accept=".pem"
          multiple={false}
          maxCount={1}
          beforeUpload={(file) => {
            setFile(file);
            return false;
          }}
        >
          {" "}
          <p className="ant-upload-drag-icon">
            <InboxOutlined />
          </p>
          <p className="ant-upload-text">Nhấn hoặc kéo thả tệp vào đây để tải tệp tin chữ ký số lên</p>
          <p className="ant-upload-hint">
            Chỉ cho phép tải lên một tệp duy nhất. Không được phép tải lên dữ liệu công ty hoặc các tệp tin bị cấm.
          </p>
        </Dragger>
      </Col>
    </Row>
  );
};

export default EvaluationSubmissionConfirmation;
