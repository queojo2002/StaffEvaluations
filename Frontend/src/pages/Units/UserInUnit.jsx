import { useEffect, useState } from "react";
import { AiFillEdit } from "react-icons/ai";
import { FaEye } from "react-icons/fa";
import { MdFingerprint } from "react-icons/md";
import { PiDownloadThin } from "react-icons/pi";
import { LoadingOutlined } from "@ant-design/icons";
import { Button, Card, Flex, Spin, Table, Tag, Tooltip } from "antd";

import { downloadSignature, exportUserEvaluationDataToExcel, getAllUserInUnit } from "~/apis";
import { openNotificationTopLeft } from "~/utils/openNotification";

const UserInUnit = (props) => {
  const { unitId } = props;
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const [datas, setDatas] = useState([]);
  const [loading, setLoading] = useState(false);
  const [loadingButtonDownloadSignature, setLoadingButtonDownloadSignature] = useState(false);
  const [loadingButtonDownloadEvaluation, setLoadingButtonDownloadEvaluation] = useState(false);

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  const handleButtonEdit = (id) => {
    openNotificationTopLeft("warning", "Thông báo!", "Vui lòng vào chức năng Quản lý người dùng để chỉnh sửa");
    return;
  };

  const handleButtonViewDetail = (id) => {
    openNotificationTopLeft("warning", "Thông báo!", "Chức năng này đang được cập nhật");
    return;
  };

  const handleDownloadEvaluation = async (id) => {
    setLoadingButtonDownloadEvaluation(true);
    try {
      const res = await exportUserEvaluationDataToExcel(id);

      if (!res || res.size === 0) {
        alert("Chưa có dữ liệu.");
        setLoadingButtonDownloadEvaluation(false);
        return;
      }

      const data = res;
      const file = new Blob([data], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });

      const a = document.createElement("a");
      a.href = window.URL.createObjectURL(file);
      a.download = "Analyst_Evaluation.xlsx";

      a.click();

      window.URL.revokeObjectURL(a.href);

      setLoadingButtonDownloadEvaluation(false);
    } catch (e) {
      console.error("Error exporting Excel:", e);
      setLoadingButtonDownloadEvaluation(false);
    }
  };

  const handleButtonDownloadSignature = async (id, fullName) => {
    setLoadingButtonDownloadSignature(true);
    try {
      const response = await downloadSignature(id);

      if (response) {
        if (response.type === "application/json") {
          openNotificationTopLeft(
            "error",
            "Thông báo",
            "Người dùng này chưa có chữ ký số hoặc có lỗi trong lúc tải. Vui lòng liên hệ QTV."
          );
          setLoadingButtonDownloadSignature(false);
          return null;
        }

        console.log(response);
        const url = window.URL.createObjectURL(new Blob([response]));

        const link = document.createElement("a");
        link.href = url;
        link.setAttribute("download", `${fullName}.pem`);
        document.body.appendChild(link);
        link.click();

        link?.parentNode?.removeChild(link);
        window.URL.revokeObjectURL(url);
        setLoadingButtonDownloadSignature(false);
      }
    } catch (error) {
      setLoadingButtonDownloadSignature(false);
      console.log("Error downloading file:", error);
    }
  };

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAllUserInUnit(unitId);
    setDatas(data1.dataList);
    setLoading(false);
  };

  const columns = [
    {
      title: "Họ và tên",
      dataIndex: "fullName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Đơn vị",
      dataIndex: "unitName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Loại người dùng",
      dataIndex: "userTypeName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Chức danh",
      dataIndex: "positionsName",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Email",
      dataIndex: "email",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Số điện thoại",
      dataIndex: "phone",
      width: 130,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Trạng thái",
      dataIndex: "isActive",
      render: (isActive) => (
        <div style={{ whiteSpace: "break-spaces", width: "100%" }}>
          {isActive === true ? <Tag color="green">Đã kích hoạt</Tag> : <Tag color="#f50">Chưa kích hoạt</Tag>}
        </div>
      )
    },
    {
      title: "Hành động",
      dataIndex: "action",
      width: "10%",
      render: (text, record) => (
        <Flex align="center" justify="center" gap={10}>
          <Tooltip title="Tải chữ ký số">
            <Button
              loading={loadingButtonDownloadSignature}
              style={{ borderRadius: 10 }}
              icon={<MdFingerprint style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                handleButtonDownloadSignature(record.id, record.fullName);
              }}
            />
          </Tooltip>
          <Tooltip title="Tải thông tin đánh giá">
            <Button
              loading={loadingButtonDownloadEvaluation}
              style={{ borderRadius: 10 }}
              icon={<PiDownloadThin style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                handleDownloadEvaluation(record.id);
              }}
            />
          </Tooltip>
          <Tooltip title="Xem chi tiết">
            <Button
              style={{ borderRadius: 10 }}
              icon={<FaEye style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                handleButtonViewDetail(record.id);
              }}
            />
          </Tooltip>
          <Tooltip title="Chỉnh sửa">
            <Button
              style={{ borderRadius: 10 }}
              icon={<AiFillEdit style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                handleButtonEdit(record.id);
              }}
            />
          </Tooltip>
        </Flex>
      )
    }
  ];

  const propsTable = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelection,
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    dataSource: datas,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  useEffect(() => {
    fetchApiGetAll();
  }, [unitId]);

  return (
    <Spin spinning={loading} indicator={<LoadingOutlined spin />}>
      <Flex gap="middle" vertical>
        <Flex align="center" gap={10} justify="space-between" style={{ width: "100%" }}>
          <Flex align="center" gap={5} justify="flex-start"></Flex>
          <Flex align="center" gap={5} justify="flex-end" style={{ width: "100%" }}></Flex>
        </Flex>
        <Card bordered={false} className="criclebox">
          <Table {...propsTable} />
        </Card>
      </Flex>
    </Spin>
  );
};

export default UserInUnit;
