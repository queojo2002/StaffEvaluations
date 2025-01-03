import { useEffect, useState } from "react";
import { AiFillEdit } from "react-icons/ai";
import { CgAdd } from "react-icons/cg";
import { FaEye } from "react-icons/fa";
import { GrSearch } from "react-icons/gr";
import { IoMdAddCircle } from "react-icons/io";
import { IoFilterSharp } from "react-icons/io5";
import { RiDeleteBin2Fill } from "react-icons/ri";
import { ExclamationCircleFilled } from "@ant-design/icons";
import { Button, Card, Divider, Flex, Input, Modal, Spin, Table, Tooltip, Typography } from "antd";
import dayjs from "dayjs";

import AddCriteriaChild from "./AddCriteriaChild";
import NewAndUpdateEvaluationCriteria, { renderTreeCriteria } from "./NewAndUpdateEvaluationCriteria";

import { getAllCategoryCriteria, getAllCategoryRating, getAllUnit, removeCategoryCriteria } from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import arrayToTree from "~/utils/arrayToTree";

const EvaluationCriteria = () => {
  const { Text } = Typography;
  const { confirm } = Modal;

  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [dataUnit, setDataUnit] = useState([]);
  const [dataCategoryRating, setDataCategoryRating] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);
  const [isOpenModalAdd, setIsOpenModalAdd] = useState(false);
  const [isOpenModalAddChild, setIsOpenModalAddChild] = useState(false);

  const [id, setId] = useState(null);

  const hasSelected = selectedRowKeys.length > 0;

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAllCategoryCriteria();
    const data2 = await getAllUnit();
    const data3 = await getAllCategoryRating();
    setDatas(data1.dataList);
    setDataUnit(data2.dataList);
    setDataCategoryRating(data3.dataList);
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
    setId(null);
    setIsOpenModalAdd(true);
  };

  const handleButtonEdit = (id) => {
    setId(id);
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
        const res = await removeCategoryCriteria(selectedRowKeys);
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

  const handleAddCriteriaChild = (id) => {
    setId(id);
    setIsOpenModalAddChild(true);
  };

  const columns = [
    {
      key: "stt",
      dataIndex: "stt",
      align: "center",
      width: 100,
      render: (text) => (
        <div
          style={{
            display: "inline-block",
            padding: "4px 8px",
            borderRadius: "8px",
            backgroundColor: "#E0F7FA",
            color: "#00796B",
            fontWeight: "bold",
            fontSize: "13px",
            minWidth: "20px",
            textAlign: "center"
          }}
        >
          {text}
        </div>
      )
    },
    {
      title: "Tên tiêu chí đánh giá",
      dataIndex: "criteriaName",
      key: "criteriaName",
      width: 500,
      align: "left",
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Thang điểm đánh giá",
      dataIndex: "startValue",
      width: 160,
      render: (text, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          {record.startValue !== null ? `${record.startValue} -> ${record.endValue}` : null}
        </div>
      )
    },
    {
      title: "Thuộc đơn vị",
      dataIndex: "unitName",
      width: 150,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Ngày cập nhật gần nhất",
      dataIndex: "updatedAt",
      width: 80,
      render: (text) => (
        <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{dayjs(text).format("DD-MM-YYYY HH:mm")}</div>
      )
    },
    {
      title: "Hành động",
      dataIndex: "action",
      width: "8%",
      render: (text, record) => (
        <Flex align="center" justify="center" gap={10}>
          <Tooltip title="Thêm tiêu chí con">
            <Button
              style={{ borderRadius: 10 }}
              icon={<CgAdd style={{ padding: 0, margin: "auto", fontSize: 15 }} />}
              onClick={() => {
                handleAddCriteriaChild(record.id);
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
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    rowSelection: rowSelection,
    loading: loading,
    dataSource: datas ? renderTreeCriteria(arrayToTree(datas)) : null,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle",
    expandIconColumnIndex: 3
  };

  useEffect(() => {
    fetchApiGetAll();
  }, []);

  return (
    <Spin spinning={loading}>
      <Modal
        title="Thêm mới tiêu chí đánh giá"
        open={isOpenModalAdd}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAdd(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <NewAndUpdateEvaluationCriteria
          listUnit={arrayToTree(dataUnit)}
          listCategoryCriteria={arrayToTree(datas)}
          listCategoryRating={dataCategoryRating}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAdd}
          id={id}
        />
      </Modal>

      <Modal
        title="Thêm tiêu chí con"
        open={isOpenModalAddChild}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAddChild(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <AddCriteriaChild
          listUnit={arrayToTree(dataUnit)}
          listCategoryCriteria={arrayToTree(datas)}
          listCategoryRating={dataCategoryRating}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAddChild}
          id={id}
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

export default EvaluationCriteria;
