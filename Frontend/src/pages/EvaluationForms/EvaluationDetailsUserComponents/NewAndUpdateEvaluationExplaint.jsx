import { useEffect, useState } from "react";
import { CheckCircleOutlined, EyeOutlined, InboxOutlined, ReloadOutlined } from "@ant-design/icons";
import { Button, Col, Divider, Row, Space, Table } from "antd";
import TextArea from "antd/es/input/TextArea";
import Dragger from "antd/es/upload/Dragger";
import dayjs from "dayjs";

import {
  getAllEvaluationExplaintWithSupervisor,
  getAllEvaluationExplaintWithUser,
  getFileAttachments,
  insertEvaluationExplaint
} from "~/apis";
import { openNotificationTopLeft } from "~/utils/openNotification";

const NewAndUpdateEvaluationExplaint = (props) => {
  const { closeModal, categoryCriteriaId, evaluationId, userIds, userId, type } = props;

  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [note, setNote] = useState("");
  const [file, setFile] = useState(null);
  const [upload, setUpload] = useState(true);

  const fetchUserTypeById = async (evaluationId, categoryCriteriaId, userIds) => {
    setLoading(true);
    const res = !userId
      ? await getAllEvaluationExplaintWithUser({
          evaluationId: evaluationId,
          categoryCriteriaId: categoryCriteriaId,
          userIds: userIds
        })
      : await getAllEvaluationExplaintWithSupervisor({
          evaluationId: evaluationId,
          categoryCriteriaId: categoryCriteriaId,
          userId: userId,
          userIds: userIds
        });
    setData(res.dataList);
    setLoading(false);
  };

  const onFinish = async () => {
    setLoading(true);

    if (note === null && file === null) {
      openNotificationTopLeft("warning", "Cảnh báo", "Vui lòng chọn tệp minh chức hoặc giải trình bằng chữ.");
      setLoading(false);
      return;
    }
    const res = await insertEvaluationExplaint({
      userId: userId,
      evaluationId: evaluationId,
      categoryCriteriaId: categoryCriteriaId,
      note: note,
      fileAttachments: file,
      type: type
    });

    if (res.isSuccess) {
      setFile(null);
      setNote(null);
      setUpload(false);
      await fetchUserTypeById(evaluationId, categoryCriteriaId, userIds);
    }
    setLoading(false);
  };

  const handleViewFile = async (id) => {
    setLoading(true);
    try {
      const res = await getFileAttachments(id);

      if (res.type === "application/json") {
        openNotificationTopLeft("warning", "Thông báo", "Giải trình này không tồn tại tệp.");
        return;
      }

      const data = res;

      const file = new Blob([data], { type: "application/pdf" });

      const fileURL = window.URL.createObjectURL(file);
      window.open(fileURL, "_blank");
    } catch (e) {
      console.error("Error downloading PDF:", e);
    } finally {
      setLoading(false);
    }
  };

  const columns = [
    {
      title: "STT",
      dataIndex: "index",
      key: "index",
      render: (text, record, index) => index + 1,
      width: 10
    },
    {
      title: "Người gửi giải trình",
      dataIndex: "fullName",
      key: "fullName",
      width: 250,
      render: (fullName) => {
        return <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{fullName}</div>;
      }
    },
    {
      title: "Ghi chú",
      dataIndex: "note",
      key: "note",
      width: 300,
      render: (text, record) => <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>{text}</div>
    },

    {
      title: "Tệp minh chứng đính kèm",
      dataIndex: "fileAttachments",
      key: "fileAttachments",
      width: 80,
      render: (item, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          <EyeOutlined
            style={{ cursor: "pointer", fontSize: 17 }}
            onClick={() => {
              handleViewFile(record.id);
            }}
          />
        </div>
      )
    },
    {
      title: "Ngày cập nhật gần nhất",
      dataIndex: "updatedAt",
      width: 200,
      render: (text, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          {text !== null ? dayjs(text).format("DD-MM-YYYY HH:mm") : null}
        </div>
      )
    }
  ];

  useEffect(() => {
    if (evaluationId && categoryCriteriaId && userIds) {
      fetchUserTypeById(evaluationId, categoryCriteriaId, userIds);
    }
  }, [categoryCriteriaId, evaluationId, userIds]);

  return (
    <div style={{ padding: 10 }}>
      <Row gutter={16}>
        <Col span={12}>
          <Dragger
            accept=".pdf"
            multiple={false}
            maxCount={1}
            beforeUpload={(file) => {
              setFile(file);
              setUpload(true);
              return false;
            }}
            file={file}
            showUploadList={upload}
          >
            {" "}
            <p className="ant-upload-drag-icon">
              <InboxOutlined />
            </p>
            <p className="ant-upload-text">Nhấn hoặc kéo thả tệp vào đây để tải lên tài liệu minh chứng</p>
            <p className="ant-upload-hint">
              Chỉ cho phép tải lên một tệp duy nhất. Không được phép tải lên dữ liệu công ty hoặc các tệp tin bị cấm.
            </p>
          </Dragger>
        </Col>
        <Col span={12}>
          <TextArea
            style={{
              height: "100%"
            }}
            rows={4}
            placeholder="Nhập giải trình vào đây nếu có"
            onChange={(e) => setNote(e.target.value)}
            value={note}
          />
        </Col>
        <Col span={24}>
          <Divider />
        </Col>
        <Col span={24}>
          <Space
            style={{
              width: "100%",
              justifyContent: "flex-end"
            }}
          >
            <Button type="default" htmlType="reset" loading={loading} icon={<ReloadOutlined />}>
              Tải lại
            </Button>
            <Button
              type="primary"
              htmlType="submit"
              loading={loading}
              icon={<CheckCircleOutlined />}
              style={{
                float: "right"
              }}
              onClick={onFinish}
            >
              Xác nhận gửi giải trình
            </Button>
          </Space>
        </Col>
      </Row>
      <Divider />
      <Table rowKey={"id"} dataSource={data} columns={columns} bordered />
    </div>
  );
};

export default NewAndUpdateEvaluationExplaint;
