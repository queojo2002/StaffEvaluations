import { useState } from "react";
import { DownloadOutlined } from "@ant-design/icons";
import { Button, Modal, Spin, Tabs } from "antd";

import WordViewer from "../WordViewer";

import { exportEvaluationDocument, exportExcelOfUser, exportPdfOfUser } from "~/apis";
import { openNotificationTopLeft } from "~/utils/openNotification";
const EvaluationDetailsUserPrint = (props) => {
  const { refetchApi, closeModal, evaluationId } = props;
  const [activeKey, setActiveKey] = useState("1");
  const [loadingButton, setLoadingButton] = useState(false);
  const [isOpenn, setIsOpenn] = useState(false);
  const [fileUrl, setFileUrl] = useState("");
  const [fileType, setFileType] = useState("doc");
  const buttonData = {
    word: [
      { id: 1, numberTemplate: 1, label: "Word - Mẫu 1 - Cán Bộ" },
      { id: 2, numberTemplate: 2, label: "Word Mẫu 2 - Công Chức - Không phải là lãnh đạo" },
      { id: 3, numberTemplate: 3, label: "Word Mẫu 3 - Công Chức - Là lãnh đạo" },
      { id: 4, numberTemplate: 4, label: "Word Mẫu 4 - Viên Chức - Không phải là lãnh đạo" },
      { id: 5, numberTemplate: 5, label: "Word Mẫu 5 - Viên Chức - Là lãnh đạo" }
    ],
    pdf: [
      { id: 6, numberTemplate: 6, label: "PDF - Bảng điểm cá nhân" }
      // { id: 7, numberTemplate: 1, label: "PDF - Mẫu 1 - Cán Bộ - Có ký số" },
      // { id: 8, numberTemplate: 2, label: "PDF - Mẫu 2 - Công Chức - Không phải là lãnh đạo - Có ký số" },
      // { id: 9, numberTemplate: 3, label: "PDF - Mẫu 3 - Công Chức - Là lãnh đạo - Có ký số" },
      // { id: 10, numberTemplate: 4, label: "PDF - Mẫu 4 - Viên Chức - không phải là lãnh đạo - Có ký số" },
      // { id: 11, numberTemplate: 5, label: "PDF - Mẫu 5 - Viên Chức - Là lãnh đạo - Có ký số" }
    ],
    excel: [{ id: 12, numberTemplate: 1, label: "Excel - Bảng điểm cá nhân" }]
  };

  const renderButtons = (type, downloadFunction) => {
    return buttonData[type].map((button) => (
      <Button
        key={button.id}
        type="link"
        icon={<DownloadOutlined />}
        style={{ display: "flex", alignItems: "center", marginBottom: 8 }}
        onClick={() => downloadFunction(button.numberTemplate)}
      >
        {button.label}
      </Button>
    ));
  };

  const downloadWordFile = async (numberTemplate) => {
    setLoadingButton(true);

    try {
      const res = await exportEvaluationDocument(evaluationId, numberTemplate, 1);

      if (res.isSuccess === true) {
        setFileType("doc");
        setFileUrl(res.message);
        setIsOpenn(true);
      } else {
        openNotificationTopLeft("warning", "Thông báo", res.message);
        setLoadingButton(false);
      }
      // if (res?.size === 0) {
      //   openNotificationTopLeft("warning", "Thông báo", "Mẫu đánh giá phải gửi cấp phê duyệt mới được in ấn.");
      //   setLoadingButton(false);
      //   return;
      // }

      // const data = new Blob([res], {
      //   type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      // });

      // const fileURL = URL.createObjectURL(data);

      // const link = document.createElement("a");
      // link.href = fileURL;
      // link.download = `Word_MauInAn_${numberTemplate}.docx`;
      // document.body.appendChild(link);
      // link.click();
      // document.body.removeChild(link);

      // URL.revokeObjectURL(fileURL);
      setLoadingButton(false);
    } catch (e) {
      console.error(e);
      setLoadingButton(false);
    }
  };

  const downloadPDFFile = async (numberTemplate) => {
    setLoadingButton(true);
    try {
      let res;

      if (numberTemplate >= 6) {
        res = await exportPdfOfUser(evaluationId);
      } else {
        res = await exportEvaluationDocument(evaluationId, numberTemplate, 2);
      }

      if (!res || res.size === 0) {
        openNotificationTopLeft("warning", "Thông báo", "Thực hiện đánh giá xong mới được in ấn.");
        setLoadingButton(false);
        return;
      }

      const data = res;

      const file = new Blob([data], { type: "application/pdf" });

      const fileURL = window.URL.createObjectURL(file);
      window.open(fileURL, "_blank");

      //window.URL.revokeObjectURL(fileURL);
    } catch (e) {
      console.error("Error downloading PDF:", e);
    } finally {
      setLoadingButton(false);
    }
  };

  const handleExcel = async () => {
    setLoadingButton(true);
    try {
      const res = await exportExcelOfUser(evaluationId);

      if (res.isSuccess === true) {
        setFileType("xlsx");
        setFileUrl(res.message);
        setIsOpenn(true);
      }
      // if (!res || res.size === 0) {
      //   openNotificationTopLeft("warning", "Thông báo", "Thực hiện đánh giá xong mới được in ấn.");
      //   setLoadingButton(false);
      //   return;
      // }

      // const data = res;
      // const file = new Blob([data], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });

      // const a = document.createElement("a");
      // a.href = window.URL.createObjectURL(file);
      // a.download = "Excel_BangDiemCaNhan.xlsx"; // Đặt tên file tải về

      // a.click();

      // window.URL.revokeObjectURL(a.href);

      setLoadingButton(false); // Tắt trạng thái tải
    } catch (e) {
      console.error("Error exporting Excel:", e); // Ghi log lỗi
      setLoadingButton(false); // Tắt trạng thái tải
    }
  };

  const items = [
    {
      key: "1",
      label: `Word`,
      children: loadingButton ? (
        <div style={{ textAlign: "center" }}>
          <Spin size="large" />
        </div>
      ) : (
        <div>{renderButtons("word", downloadWordFile)}</div>
      )
    },
    {
      key: "2",
      label: `PDF`,
      children: loadingButton ? (
        <div style={{ textAlign: "center" }}>
          <Spin size="large" />
        </div>
      ) : (
        <div>{renderButtons("pdf", downloadPDFFile)}</div>
      )
    },
    {
      key: "3",
      label: `Excel`,
      children: loadingButton ? (
        <div style={{ textAlign: "center" }}>
          <Spin size="large" />
        </div>
      ) : (
        <div>{renderButtons("excel", handleExcel)}</div>
      )
    }
  ];

  return (
    <>
      <Modal
        title={"Xem trước biểu mẫu"}
        width={1200}
        confirmLoading={loadingButton}
        open={isOpenn}
        onCancel={() => {
          setIsOpenn(false);
        }}
        style={{
          top: 20
        }}
        footer={null}
      >
        <WordViewer fileType={fileType} fileUrl={fileUrl} />
      </Modal>
      <Tabs activeKey={activeKey} onChange={setActiveKey} items={items} />
    </>
  );
};

export default EvaluationDetailsUserPrint;
