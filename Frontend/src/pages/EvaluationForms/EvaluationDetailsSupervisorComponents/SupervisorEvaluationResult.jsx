import React from "react";
import { Col, Form, Row } from "antd";
import TextArea from "antd/es/input/TextArea";
import { debounce } from "lodash";

const SupervisorEvaluationResult = (props) => {
  const {
    bindingNhanXetUuKhuyetDiem,
    bindingNhanDinhChieuHuongPhatTrien,
    setBindingNhanXetUuKhuyetDiem,
    setBindingNhanDinhChieuHuongPhatTrien
  } = props;

  const handleNhanXetChange = debounce(setBindingNhanXetUuKhuyetDiem, 300);
  const handleNhanDinhChange = debounce(setBindingNhanDinhChieuHuongPhatTrien, 300);

  return (
    <Form
      layout="vertical"
      initialValues={{
        nhanXetUuKhuyetDiem: bindingNhanXetUuKhuyetDiem,
        nhanDinhChieuHuongPhatTrien: bindingNhanDinhChieuHuongPhatTrien
      }}
    >
      <Row gutter={16}>
        <Col span={24}>
          <Form.Item label="Nhận xét ưu, khuyết điểm: " name={"nhanXetUuKhuyetDiem"} wrapperCol={{ span: 24 }}>
            <TextArea
              onChange={(e) => handleNhanXetChange(e.target.value)}
              className="evaluation-addReviews"
              placeholder="Nhận xét ưu, khuyết điểm"
              rows={4}
            />
          </Form.Item>
        </Col>
        <Col span={24}>
          <Form.Item
            label="Nhận định chiều hướng, triển vọng phát triển của cán bộ viên chức: "
            name={"nhanDinhChieuHuongPhatTrien"}
            wrapperCol={{ span: 24 }}
          >
            <TextArea
              onChange={(e) => handleNhanDinhChange(e.target.value)}
              className="evaluation-addReviews"
              placeholder="Nhận định chiều hướng, triển vọng phát triển của cán bộ viên chức"
              rows={4}
            />
          </Form.Item>
        </Col>
      </Row>
    </Form>
  );
};

export default SupervisorEvaluationResult;
