import { useState } from "react";
import { CheckCircleOutlined, FileWordOutlined, InboxOutlined, RetweetOutlined } from "@ant-design/icons";
import { Alert, Button, Col, Divider, Row, Space, Spin } from "antd";
import Dragger from "antd/es/upload/Dragger";

import { confirmConsolidationAndTransferEvaluations } from "~/apis";
import { listItemBeforeStyle, listItemStyle, listStyle } from "~/utils/styleCustom";
const EvaluationCAT = (props) => {
  const { id, refetchApi, setIsOpenModalConsolidationAndTransfer } = props;

  const [loadingButton, setLoadingButton] = useState(false);
  const [fileWordUpload, setFileWordUpload] = useState(null);
  const [fileElectronicSignature, setFileElectronicSignature] = useState(null);

  const handleConfirm = async () => {
    setLoadingButton(true);

    if (fileWordUpload === null || fileWordUpload === undefined) {
      alert("Vui lòng chọn file Báo Cáo Word cần tổng hợp và chuyển.");
      setLoadingButton(false);
      return false;
    } else if (fileElectronicSignature === null || fileElectronicSignature === undefined) {
      alert("Vui lòng chọn file Chữ Chữ Số cần tổng hợp và chuyển.");
      setLoadingButton(false);
      return false;
    }

    const fileWordUploadSizeMB = fileWordUpload.size / (1024 * 1024);
    const fileESUploadSizeMB = fileElectronicSignature.size / (1024 * 1024);

    if (fileWordUploadSizeMB > 10 || fileESUploadSizeMB > 10) {
      alert("Dung lượng tệp tin quá lớn, vui lòng chọn tệp tin khác");
      setLoadingButton(false);
      return false;
    }

    try {
      const result = await confirmConsolidationAndTransferEvaluations({
        evaluationConsolidationAndTransferId: id,
        fileWord: fileWordUpload,
        fileES: fileElectronicSignature
      });

      if (result.isSuccess) {
        refetchApi();
        setIsOpenModalConsolidationAndTransfer(false);
      }
    } catch (error) {
      console.log(error);
    } finally {
      setLoadingButton(false);
    }
  };

  return (
    <Spin spinning={loadingButton}>
      <Alert
        message="Lưu ý"
        description={
          <ul style={listStyle}>
            <li style={listItemStyle}>
              <span style={listItemBeforeStyle}>- </span>Vui lòng tải &quot;Tệp báo cáo word mẫu&quot; để điền dữ liệu
              cần thiết trước khi tải Báo cáo lên hệ thống.
            </li>
          </ul>
        }
        type="info"
        showIcon
        style={{ marginBottom: 16 }}
      />
      {loadingButton ? (
        <div style={{ textAlign: "center" }}>
          <Spin size="large" />
        </div>
      ) : (
        <>
          <Row gutter={16}>
            <Col
              span={12}
              style={{
                marginBottom: 20
              }}
            >
              <Dragger
                multiple={false}
                maxCount={1}
                accept=".doc,.docx"
                beforeUpload={(fileWord) => {
                  setFileWordUpload(fileWord);
                  return false;
                }}
              >
                {" "}
                <p className="ant-upload-drag-icon">
                  <FileWordOutlined />
                </p>
                <p className="ant-upload-text">Nhấn hoặc kéo thả tệp BÁO CÁO WORD vào đây</p>
                <p className="ant-upload-hint">
                  Chỉ cho phép tải lên một tệp duy nhất. Không được phép tải lên các tệp tin bị cấm.
                </p>
              </Dragger>
            </Col>
            <Col
              span={12}
              style={{
                marginBottom: 20
              }}
            >
              <Dragger
                multiple={false}
                accept=".pem"
                maxCount={1}
                beforeUpload={(fileES) => {
                  setFileElectronicSignature(fileES);
                  return false;
                }}
              >
                {" "}
                <p className="ant-upload-drag-icon">
                  <InboxOutlined />
                </p>
                <p className="ant-upload-text">Nhấn hoặc kéo thả tệp CHỮ KÝ SỐ vào đây</p>
                <p className="ant-upload-hint">
                  Chỉ cho phép tải lên một tệp duy nhất. Không được phép tải lên các tệp tin bị cấm.
                </p>
              </Dragger>
            </Col>

            <Divider />
            <Col span={24}>
              <Space
                style={{
                  width: "100%",
                  justifyContent: "flex-end"
                }}
              >
                <Button
                  type="default"
                  htmlType="reset"
                  icon={<RetweetOutlined />}
                  loading={loadingButton}
                  onClick={() => {
                    setIsOpenModalConsolidationAndTransfer(false);
                  }}
                >
                  Hủy bỏ thao tác
                </Button>
                <Button
                  type="primary"
                  htmlType="submit"
                  icon={<CheckCircleOutlined />}
                  style={{
                    float: "right"
                  }}
                  onClick={handleConfirm}
                  loading={loadingButton}
                >
                  Xác nhận tổng hợp và chuyển
                </Button>
              </Space>
            </Col>
          </Row>
        </>
      )}
    </Spin>
  );
};

export default EvaluationCAT;
