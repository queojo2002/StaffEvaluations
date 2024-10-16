import React, { useState } from "react";
import { AiFillEdit } from "react-icons/ai";
import { FaEye } from "react-icons/fa";
import { GrSearch } from "react-icons/gr";
import { IoMdAddCircle } from "react-icons/io";
import { IoFilterSharp } from "react-icons/io5";
import { RiDeleteBin2Fill } from "react-icons/ri";
import { LoadingOutlined } from "@ant-design/icons";
import { Button, Card, Divider, Flex, Input, Modal, Spin, Table, Tooltip, Typography } from "antd";

import Breadcrumbs from "../../components/Breadcrumbs";

import User from "./_id";
import AddNewUser from "./AddNewUser";

const dataSource = [
  {
    key: 1,
    id: 1,
    fullName: `Trần Nguyễn Đức Minh`,
    unitName: `THPT Lộc Ninh`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `ducln339@gmail.com`,
    phone: `0326393540`,
    address: `Lộc Ninh, Bình Phước`,
    birthDay: `2014-12-24 23:12:00`
  },
  {
    key: 2,
    id: 2,
    fullName: `Nguyễn Văn A`,
    unitName: `THPT Bình Long`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `nguyenvana@gmail.com`,
    phone: `0901234567`,
    address: `Bình Long, Bình Phước`,
    birthDay: `1990-05-12 08:30:00`
  },
  {
    key: 3,
    id: 3,
    fullName: `Phạm Thị B`,
    unitName: `THPT Đồng Xoài`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `phamthib@gmail.com`,
    phone: `0912345678`,
    address: `Đồng Xoài, Bình Phước`,
    birthDay: `1988-07-25 14:45:00`
  },
  {
    key: 4,
    id: 4,
    fullName: `Lê Hồng C`,
    unitName: `THPT Chơn Thành`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `lehonc@gmail.com`,
    phone: `0987654321`,
    address: `Chơn Thành, Bình Phước`,
    birthDay: `1985-10-10 11:15:00`
  },
  {
    key: 5,
    id: 5,
    fullName: `Võ Tấn D`,
    unitName: `THPT Bù Đăng`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `votand@gmail.com`,
    phone: `0976543210`,
    address: `Bù Đăng, Bình Phước`,
    birthDay: `1995-01-20 09:00:00`
  },
  {
    key: 6,
    id: 6,
    fullName: `Đỗ Thị E`,
    unitName: `THPT Phước Long`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `dothie@gmail.com`,
    phone: `0965432109`,
    address: `Phước Long, Bình Phước`,
    birthDay: `1992-11-15 07:45:00`
  },
  {
    key: 7,
    id: 7,
    fullName: `Hoàng Văn F`,
    unitName: `THPT Lộc Thành`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `hoangvanf@gmail.com`,
    phone: `0954321098`,
    address: `Lộc Thành, Bình Phước`,
    birthDay: `1987-03-03 13:25:00`
  },
  {
    key: 8,
    id: 8,
    fullName: `Trương Thị G`,
    unitName: `THPT Tân Phú`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `truongthig@gmail.com`,
    phone: `0943210987`,
    address: `Tân Phú, Bình Phước`,
    birthDay: `1993-08-18 10:00:00`
  },
  {
    key: 9,
    id: 9,
    fullName: `Ngô Thanh H`,
    unitName: `THPT Đồng Phú`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `ngothanhh@gmail.com`,
    phone: `0932109876`,
    address: `Đồng Phú, Bình Phước`,
    birthDay: `1991-06-14 16:00:00`
  },
  {
    key: 10,
    id: 10,
    fullName: `Bùi Văn I`,
    unitName: `THPT Bù Gia Mập`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `buivani@gmail.com`,
    phone: `0921098765`,
    address: `Bù Gia Mập, Bình Phước`,
    birthDay: `1994-02-02 18:30:00`
  },
  {
    key: 11,
    id: 11,
    fullName: `Lý Thị J`,
    unitName: `THPT Bình Tân`,
    positionsName: `Viên chức giáo viên`,
    userTypeName: `Giáo viên`,
    email: `lythij@gmail.com`,
    phone: `0910987654`,
    address: `Bình Tân, Bình Phước`,
    birthDay: `1996-04-21 12:00:00`
  }
];

const Users = () => {
  const { Text, Title } = Typography;

  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const [loading, setLoading] = useState(false);
  const [isUserModalOpen, setIsUserModalOpen] = useState(false);
  const [isAddNewModalOpen, setIsAddNewModalOpen] = useState(false);
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
    setIsAddNewModalOpen(true);
  };

  const handleButtonEdit = (id) => {};

  const handleButtonDelete = () => {
    console.log(selectedRowKeys);
    setSelectedRowKeys([]);
  };

  const handleButtonViewDetail = (id) => {
    setUserId(id);
    setIsUserModalOpen(true);
  };

  const columns = [
    {
      title: "Họ và tên",
      dataIndex: "fullName",
      width: 180,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Đơn vị",
      dataIndex: "unitName",
      width: 150,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Chức danh",
      dataIndex: "positionsName",
      width: 180,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Chức vụ",
      dataIndex: "userTypeName",
      width: 150,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Email",
      dataIndex: "email",
      width: 200,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Số điện thoại",
      dataIndex: "phone",
      width: 130,
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Địa chỉ",
      dataIndex: "address",
      width: 200,
      render: (text) => <Text>{text}</Text>
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
      columnWidth: 80
    },
    columns: columns,
    dataSource: dataSource,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  // useEffect(() => {
  //   setTimeout(() => {
  //     setLoading(false);
  //   }, 1000);
  // }, []);

  return (
    <Spin spinning={loading} indicator={<LoadingOutlined spin />}>
      <Modal
        title="User Details"
        open={isUserModalOpen}
        onOk={() => {}}
        onCancel={() => {
          setIsUserModalOpen(false);
        }}
        footer={null}
      >
        <User id={userId} />
      </Modal>
      <Modal
        title="Thêm mới người dùng"
        open={isAddNewModalOpen}
        onOk={() => {}}
        onCancel={() => {
          setIsAddNewModalOpen(false);
        }}
        footer={null}
      >
        <AddNewUser id={userId} />
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
