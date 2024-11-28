import { useEffect, useState } from "react";
import { AiFillEdit } from "react-icons/ai";
import { FaEye } from "react-icons/fa";
import { GrSearch } from "react-icons/gr";
import { IoMdAddCircle } from "react-icons/io";
import { IoFilterSharp } from "react-icons/io5";
import { MdFingerprint } from "react-icons/md";
import { PiDownloadThin } from "react-icons/pi";
import { RiDeleteBin2Fill } from "react-icons/ri";
import { ExclamationCircleFilled, LoadingOutlined } from "@ant-design/icons";
import { Button, Card, Divider, Flex, Input, Modal, Spin, Table, Tag, Tooltip, Typography } from "antd";

import DetailsUser from "./DetailsUser";
import NewAndUpdateUser from "./NewAndUpdateUser";

import {
  downloadSignature,
  exportUserEvaluationDataToExcel,
  getAllRoles,
  getAllUnit,
  getAllUser,
  getAllUserType,
  removeRangeUser
} from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import arrayToTree from "~/utils/arrayToTree";
import { openNotificationTopLeft } from "~/utils/openNotification";

const Users = () => {
  const { Text, Title } = Typography;
  const { confirm } = Modal;
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [units, setUnits] = useState([]);
  const [roles, setRoles] = useState([]);
  const [loadingButtonDownloadSignature, setLoadingButtonDownloadSignature] = useState(false);
  const [loadingButtonDownloadEvaluation, setLoadingButtonDownloadEvaluation] = useState(false);
  const [userTypes, setUserTypes] = useState([]);
  const [isDetailsUserModalOpen, setIsDetailsUserModalOpen] = useState(false);
  const [isOpenModalAdd, setIsOpenModalAdd] = useState(false);
  const [userId, setUserId] = useState(null);
  const hasSelected = selectedRowKeys.length > 0;

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  const handleButtonAddNew = () => {
    setUserId(null);
    setIsOpenModalAdd(true);
  };

  const handleButtonEdit = (id) => {
    setUserId(id);
    setIsOpenModalAdd(true);
  };

  const handleButtonDelete = () => {
    confirm({
      title: (
        <>
          Bạn có muốn xóa <Text style={{ color: "red", fontSize: 16 }}>{selectedRowKeys.length}</Text> mục này không?
        </>
      ),

      icon: <ExclamationCircleFilled />,
      content: "Khi nhấn nút Đồng ý, bạn vui lòng chờ đến khi hộp thoại này tắt.",
      onOk: async () => {
        const res = await removeRangeUser(selectedRowKeys);
        if (res.isSuccess) {
          await fetchApiGetAll();
          setSelectedRowKeys([]);
        }
      },
      onCancel() {
        setSelectedRowKeys([]);
      },
      okText: "Đồng ý",
      cancelText: "Huỷ bỏ",
      width: 500
    });
  };

  const handleButtonViewDetail = (id) => {
    setUserId(id);
    setIsDetailsUserModalOpen(true);
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
    const data1 = await getAllUser();
    const data2 = await getAllRoles();
    const data3 = await getAllUnit();
    const data4 = await getAllUserType();
    setDatas(data1.dataList);
    setRoles(data2.dataList);
    setUnits(data3.dataList);
    setUserTypes(data4.dataList);
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
    // {
    //   title: "Địa chỉ",
    //   dataIndex: "address",
    //   render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    // },
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
  }, []);

  return (
    <Spin spinning={loading} indicator={<LoadingOutlined spin />}>
      <Modal
        style={{ top: 20 }}
        width={1200}
        title="Thêm mới người dùng"
        open={isOpenModalAdd}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAdd(false);
        }}
        footer={null}
      >
        <NewAndUpdateUser
          listUserType={userTypes}
          listRole={roles}
          listUnit={arrayToTree(units)}
          id={userId}
          closeModal={setIsOpenModalAdd}
          refetchApi={fetchApiGetAll}
        />
      </Modal>

      <Modal
        style={{ top: 20 }}
        width={1200}
        title="Chi tiết người dùng"
        open={isDetailsUserModalOpen}
        onOk={() => {}}
        onCancel={() => {
          setIsDetailsUserModalOpen(false);
        }}
        footer={null}
      >
        <DetailsUser id={userId} closeModal={setIsDetailsUserModalOpen} refetchApi={fetchApiGetAll} />
      </Modal>

      <Breadcrumbs />
      <Divider />
      <Flex gap="middle" vertical>
        <Flex align="center" gap={10} justify="space-between" style={{ width: "100%" }}>
          <Flex align="center" gap={5} justify="flex-start">
            <Button
              type="primary"
              onClick={handleButtonAddNew}
              loading={loading}
              style={{ borderRadius: 10, fontSize: 12, height: 40, padding: "0 15px" }}
              icon={<IoMdAddCircle style={{ paddingTop: 2, fontSize: 18 }} />}
            >
              Thêm mới
            </Button>
            <Button
              danger
              type="primary"
              onClick={handleButtonDelete}
              disabled={!hasSelected}
              loading={loading}
              style={{ borderRadius: 10, fontSize: 12, height: 40, padding: "0 15px" }}
              icon={<RiDeleteBin2Fill style={{ paddingTop: 2, fontSize: 18 }} />}
            >
              {hasSelected ? `Xoá ${selectedRowKeys.length} mục này` : "Xoá"}
            </Button>
          </Flex>
          <Flex align="center" gap={5} justify="flex-end" style={{ width: "100%" }}>
            <Tooltip title="Khi nhập xong bạn cần chờ 1-2s để hệ thống tìm kiếm dữ liệu nhé!">
              <Input
                style={{ borderRadius: 10, fontSize: 14, width: "30%", height: 40 }}
                placeholder="Tìm kiếm mọi thứ ở đây..."
                suffix={<GrSearch style={{ fontSize: 18, paddingRight: 2 }} />}
                allowClear
              />
            </Tooltip>

            <Button
              onClick={() => {}}
              loading={loading}
              style={{ borderRadius: 10, fontSize: 12, height: 40, padding: 15, fontWeight: "bold" }}
              icon={<IoFilterSharp style={{ paddingTop: 2, fontSize: 18 }} />}
            >
              Lọc
            </Button>
          </Flex>
        </Flex>
        <Card bordered={false} className="criclebox">
          <Table {...propsTable} />
        </Card>
      </Flex>
    </Spin>
  );
};

export default Users;
