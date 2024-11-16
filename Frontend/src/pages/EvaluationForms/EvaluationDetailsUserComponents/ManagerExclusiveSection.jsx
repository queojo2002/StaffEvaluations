import React, { useCallback } from "react";
import { Col, Form, Row } from "antd";
import TextArea from "antd/es/input/TextArea";
import _ from "lodash";

const ManagerExclusiveSection = (props) => {
  const {
    bindingKetQuaHoatDongCoQuan,
    setBindingKetQuaHoatDongCoQuan,
    bindingNangLucLanhDaoQuanLy,
    setBindingNangLucLanhDaoQuanLy,
    bindingNangLucTapHopDoanKet,
    setBindingNangLucTapHopDoanKet
  } = props;

  const debouncedSetKetQuaHoatDongCoQuan = useCallback(_.debounce(setBindingKetQuaHoatDongCoQuan, 500), []);
  const debouncedSetNangLucLanhDaoQuanLy = useCallback(_.debounce(setBindingNangLucLanhDaoQuanLy, 500), []);
  const debouncedSetNangLucTapHopDoanKet = useCallback(_.debounce(setBindingNangLucTapHopDoanKet, 500), []);

  return (
    <Row gutter={16}>
      <Col span={24}>
        <Form.Item
          label="Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách: "
          name={"KetQuaHoatDongCoQuan"}
          wrapperCol={{ span: 24 }}
          rules={[
            {
              required: true,
              message: "Vui lòng nhập Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách"
            }
          ]}
        >
          <TextArea
            defaultValue={bindingKetQuaHoatDongCoQuan}
            onChange={(e) => debouncedSetKetQuaHoatDongCoQuan(e.target.value)}
            className="evaluation-addReviews"
            placeholder="Kết quả hoạt động của cơ quan, tổ chức, đơn vị..."
            rows={4}
          />
        </Form.Item>
      </Col>
      <Col span={24}>
        <Form.Item
          label="Năng lực lãnh đạo, quản lý: "
          name={"NangLucLanhDaoQuanLy"}
          wrapperCol={{ span: 24 }}
          rules={[
            {
              required: true,
              message: "Vui lòng nhập Năng lực lãnh đạo, quản lý"
            }
          ]}
        >
          <TextArea
            defaultValue={bindingNangLucLanhDaoQuanLy}
            onChange={(e) => debouncedSetNangLucLanhDaoQuanLy(e.target.value)}
            className="evaluation-addReviews"
            placeholder="Năng lực lãnh đạo, quản lý"
            rows={4}
          />
        </Form.Item>
      </Col>
      <Col span={24}>
        <Form.Item
          label="Năng lực tập hợp, đoàn kết: "
          name={"NangLucTapHopDoanKet"}
          wrapperCol={{ span: 24 }}
          rules={[
            {
              required: true,
              message: "Vui lòng nhập Năng lực tập hợp, đoàn kết"
            }
          ]}
        >
          <TextArea
            defaultValue={bindingNangLucTapHopDoanKet}
            onChange={(e) => debouncedSetNangLucTapHopDoanKet(e.target.value)}
            className="evaluation-addReviews"
            placeholder="Năng lực tập hợp, đoàn kết"
            rows={4}
          />
        </Form.Item>
      </Col>
    </Row>
  );
};

export default ManagerExclusiveSection;
