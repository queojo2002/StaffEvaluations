import { useEffect, useState } from "react";
import { AiFillEdit } from "react-icons/ai";
import { FaEye } from "react-icons/fa";
import { GrSearch } from "react-icons/gr";
import { IoMdAddCircle } from "react-icons/io";
import { IoFilterSharp } from "react-icons/io5";
import { RiDeleteBin2Fill } from "react-icons/ri";
import { ExclamationCircleFilled } from "@ant-design/icons";
import { Button, Card, Divider, Flex, Input, Modal, Spin, Table, Tooltip, Typography } from "antd";
import dayjs from "dayjs";

import NewAndEditRoles from "./NewAndEditRoles";

import { getAllMenuItems, getAllRoles, removeRangeRoleAndMenuItems } from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";

const Roles = () => {
  const { Text } = Typography;
  const { confirm } = Modal;

  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [dataMenuItems, setDataMenuItems] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);
  const [isOpenModalAdd, setIsOpenModalAdd] = useState(false);
  const [roleId, setRoleId] = useState(null);

  const hasSelected = selectedRowKeys.length > 0;

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAllRoles();
    const data2 = await getAllMenuItems();
    setDatas(data1.dataList);
    setDataMenuItems(data2.dataList);
    setLoading(false);
  };

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  const handleButtonAddNew = () => {
    setRoleId(null);
    setIsOpenModalAdd(true);
  };

  const handleButtonEdit = (id) => {
    setRoleId(id);
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
        const res = await removeRangeRoleAndMenuItems(selectedRowKeys);
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
    setIsUserModalOpen(true);
  };

  const columns = [
    {
      title: "Tên vai trò",
      dataIndex: "roleName",
      width: 180,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Ngày cập nhật gần nhất",
      dataIndex: "updatedAt",
      width: 200,
      render: (text) => <Text>{dayjs(text).format("DD-MM-YYYY HH:mm")}</Text>
    },
    {
      title: "Hành động",
      dataIndex: "action",
      width: 200,
      render: (text, record) => (
        <Flex align="center" justify="flex-start" gap={10}>
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
    rowSelection: {
      ...rowSelection,
      columnWidth: 60
    },
    columns: columns,
    dataSource: datas,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  useEffect(() => {
    fetchApiGetAll();
  }, []);

  return (
    <Spin spinning={loading}>
      <Modal
        title="Thêm mới vai trò"
        open={isOpenModalAdd}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAdd(false);
        }}
        footer={null}
      >
        <NewAndEditRoles
          listMenuItems={dataMenuItems}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAdd}
          roleId={roleId}
        />
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

export default Roles;