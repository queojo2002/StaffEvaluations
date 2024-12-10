import { useEffect } from "react";
import DocViewer, { DocViewerRenderers } from "react-doc-viewer";
import { IoDownloadOutline } from "react-icons/io5";
import { Button } from "antd";

const WordViewer = ({ fileUrl, fileType }) => {
  useEffect(() => {
    console.log(fileUrl);
  }, []);

  if (!fileUrl) {
    return <p>Loading...</p>;
  }

  return (
    <>
      <div style={{ textAlign: "center", fontWeight: "bold", paddingBottom: 10 }}>
        <h2>Nội dung biểu mẫu</h2>
        <Button icon={<IoDownloadOutline />} type="primary" href={fileUrl}>
          Tải xuống
        </Button>
      </div>

      <DocViewer
        style={{
          height: "78vh"
        }}
        pluginRenderers={DocViewerRenderers}
        documents={[
          {
            uri: fileUrl,
            fileType: fileType
          }
        ]}
        config={{
          header: {
            disableFileName: true,
            disableHeader: true
          }
        }}
      />
    </>
  );
};

export default WordViewer;
