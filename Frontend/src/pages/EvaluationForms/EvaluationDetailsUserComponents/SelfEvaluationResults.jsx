import React from "react";
import { Col, Form, Row } from "antd";
import TextArea from "antd/es/input/TextArea";
import { debounce } from "lodash";

const SelfEvaluationResults = (props) => {
  const { bindingAddReview, setBindingAddReview } = props;
  const handleChange = debounce((value) => setBindingAddReview(value), 300);

  return (
    <Row gutter={16}>
      <Col span={24}>
        <Form.Item
          label="Kết quả tự nhận xét đánh giá: "
          name={"addReviews"}
          wrapperCol={{ span: 24 }}
          rules={[
            {
              required: true,
              message: "Vui lòng chọn nhận xét đánh giá"
            }
          ]}
        >
          <>
            <TextArea
              className="evaluation-addReviews"
              placeholder="Nhận xét đánh giá"
              rows={14}
              defaultValue={bindingAddReview}
              onChange={(e) => {
                handleChange(e.target.value);
              }}
            />
          </>
        </Form.Item>
      </Col>
    </Row>
  );
};

export default SelfEvaluationResults;
