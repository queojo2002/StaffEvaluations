import { useState } from "react";
import { DownloadOutlined } from "@ant-design/icons";
import { Button, Spin } from "antd";

import { exportWordSampleCAT } from "~/apis";

const EvaluationCATListFileExample = (props) => {
  const { id } = props;

  const [loadingButton, setLoadingButton] = useState(false);

  const handleDownloadWordSample = async (idCat) => {
    setLoadingButton(true);

    try {
      const res = await exportWordSampleCAT(idCat);

      if (res.size === 0) {
        alert("Phiếu này hiện tại chưa thể Tổng hợp và chuyển.");
        return;
      }

      const file = new Blob([res]);
      const url = window.URL.createObjectURL(file);

      const link = document.createElement("a");
      link.href = url;
      link.download = "BaoCaoMau.docx";
      link.click();

      window.URL.revokeObjectURL(url);
    } catch (error) {
      await HandleError(error);
    } finally {
      setLoadingButton(false);
    }
  };

  return (
    <>
      {loadingButton ? (
        <div style={{ textAlign: "center" }}>
          <Spin size="large" />
        </div>
      ) : (
        <div>
          <Button
            key={1}
            type="link"
            icon={<DownloadOutlined />}
            style={{ display: "flex", alignItems: "center", marginBottom: 8 }}
            onClick={() => handleDownloadWordSample(id)}
          >
            Word mẫu 1 - Tải tệp báo cáo word mẫu
          </Button>
        </div>
      )}
    </>
  );
};

export default EvaluationCATListFileExample;
