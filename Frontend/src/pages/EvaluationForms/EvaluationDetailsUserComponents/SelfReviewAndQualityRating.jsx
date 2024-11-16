import React from "react";
import { Col, Form, Row } from "antd";
import TextArea from "antd/es/input/TextArea";

const SelfReviewAndQualityRating = (props) => {
  const {
    suggestions,
    advantageRef,
    bindingDisAdvantage,
    bindingAdvantage,
    selectedDisadvantages,
    selectedAdvantages,
    isSuggestDisAdvantageOpen,
    isSuggestAdvantageOpen,
    handleTextAreaChange,
    handleSelectSuggestion
  } = props;

  return (
    <Row>
      <Col span={24}>
        <Form.Item
          label="Ưu điểm: "
          name={"advantages"}
          labelCol={{ span: 2 }}
          wrapperCol={{ span: 22 }}
          rules={[
            {
              required: true,
              message: "Vui lòng nhập Ưu điểm"
            }
          ]}
        >
          <>
            <TextArea
              key={bindingAdvantage}
              className="evaluation-advantages"
              defaultValue={selectedAdvantages}
              onChange={(e) => handleTextAreaChange(e, "advantages")}
              placeholder="Đánh giá ưu điểm"
              rows={7}
              ref={advantageRef}
            />
            {suggestions && isSuggestAdvantageOpen && (
              <ul className="evaluation-suggestions">
                {suggestions.map((item, index) => (
                  <li
                    key={index}
                    onClick={() => handleSelectSuggestion(item, "advantages")}
                    style={{
                      cursor: "pointer",
                      transition: "background-color 0.3s"
                    }}
                    onMouseEnter={(e) => (e.target.style.backgroundColor = "#f0f0f0")}
                    onMouseLeave={(e) => (e.target.style.backgroundColor = "white")}
                  >
                    {item.label}
                  </li>
                ))}
              </ul>
            )}
          </>
        </Form.Item>
      </Col>

      <Col span={24}>
        <Form.Item
          label="Nhược điểm: "
          name={"disAdvantages"}
          labelCol={{ span: 2 }}
          wrapperCol={{ span: 22 }}
          rules={[
            {
              required: true,
              message: "Vui lòng nhập Nhược điểm"
            }
          ]}
        >
          <>
            <TextArea
              key={bindingDisAdvantage}
              className="evaluation-disAdvantages"
              defaultValue={selectedDisadvantages}
              onChange={(e) => handleTextAreaChange(e, "disAdvantages")}
              placeholder="Đánh giá nhược điểm"
              rows={7}
            />
            {suggestions && isSuggestDisAdvantageOpen && (
              <ul className="evaluation-suggestions">
                {suggestions.map((item, index) => (
                  <li
                    key={index}
                    onClick={() => handleSelectSuggestion(item, "disAdvantages")}
                    style={{
                      cursor: "pointer",
                      transition: "background-color 0.3s"
                    }}
                    onMouseEnter={(e) => (e.target.style.backgroundColor = "#f0f0f0")}
                    onMouseLeave={(e) => (e.target.style.backgroundColor = "white")}
                  >
                    {item.label}
                  </li>
                ))}
              </ul>
            )}
          </>
        </Form.Item>
      </Col>
    </Row>
  );
};

export default SelfReviewAndQualityRating;
