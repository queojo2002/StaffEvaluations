import { useEffect, useState } from "react";
import { AiOutlineEdit } from "react-icons/ai";
import { CiSettings } from "react-icons/ci";
import { GoClockFill } from "react-icons/go";
import { IoMdAddCircle, IoMdAddCircleOutline } from "react-icons/io";
import { RiDeleteBin2Fill } from "react-icons/ri";
import { ExclamationCircleFilled, SettingOutlined } from "@ant-design/icons";
import { Button, Card, Col, Divider, Dropdown, Modal, Popconfirm, Row, Space, Spin, Table, Typography } from "antd";
import dayjs from "dayjs";

import NewAndUpdateEvaluationPeriods from "../EvaluationPeriods/NewAndUpdateEvaluationPeriods";

import AddAndUpdateCriteriaToEvaluation from "./AddAndUpdateCriteriaToEvaluation";
import AddAndUpdateCriteriaToListEvaluation from "./AddAndUpdateCriteriaToListEvaluation";
import EditEvaluation from "./EditEvaluation";
import NewEvaluation from "./NewEvaluation";
import SettingEvaluation from "./SettingEvaluation";
import UpdateTimeTypeToEvaluation from "./UpdateTimeTypeToEvaluation";

import {
  getAllCategoryCriteria,
  getAllCategoryTimeType,
  getAllEvaluation,
  getAllEvaluationSample,
  getAllUnit,
  removeEvaluation,
  testtt
} from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import arrayToTree from "~/utils/arrayToTree";
import { openNotificationTopLeft } from "~/utils/openNotification";

const Evaluation = () => {
  const { Text } = Typography;
  const { confirm } = Modal;

  const [id, setId] = useState(null);
  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [dataUnit, setDataUnit] = useState([]);
  const [dataCategoryTimeType, setDataCategoryTimeType] = useState([]);
  const [dataCategoryCriteria, setDataCategoryCriteria] = useState([]);
  const [dataEvaluationSample, setDataEvaluationSample] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);
  const [isOpenModalAdd, setIsOpenModalAdd] = useState(false);
  const [isOpenModalEdit, setIsOpenModalEdit] = useState(false);
  const [isOpenModalAddPeriods, setIsOpenModalAddPeriods] = useState(false);
  const [isOpenModalSetting, setIsOpenModalSetting] = useState(false);
  const [isOpenModalAddCriteriaToEvaluation, setIsOpenModalAddCriteriaToEvaluation] = useState(false);
  const [isOpenModalAddCriteriaToListEvaluation, setIsOpenModalAddCriteriaToListEvaluation] = useState(false);
  const [isOpenModalUpdateTimeType, setIsOpenModalUpdateTimeType] = useState(false);

  const hasSelected = selectedRowKeys.length > 0;

  const fetchApiGetAll = async () => {
    setLoading(true);
    try {
      const [data1, data2, data3, data4, data5] = await Promise.all([
        getAllEvaluation(),
        getAllUnit(),
        getAllCategoryTimeType(),
        getAllCategoryCriteria(),
        getAllEvaluationSample()
      ]);

      const res = await testtt();

      // if (res.code === "ERR_NETWORK") {
      //   openNotificationTopLeft("error", "Vui lòng mở phần mềm ký số lên", "");
      //   return;
      // }

      setDatas(data1.dataList);
      setDataUnit(data2.dataList);
      setDataCategoryTimeType(data3.dataList);
      setDataCategoryCriteria(data4.dataList);
      setDataEvaluationSample(data5.dataList);
    } catch (error) {
      console.error("Error fetching data:", error);
      openNotificationTopLeft("error", "Thông báo lỗi!", error);
    } finally {
      setLoading(false);
    }
  };

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  const itemsMenuAction = (record) => [
    {
      key: "0",
      label: "Cấu hình",
      icon: <CiSettings />,
      onClick: () => {
        handleButtonSetting(record.id);
      }
    },

    {
      key: "1",
      label: "Chỉnh sửa",
      icon: <AiOutlineEdit />,
      onClick: () => {
        handleButtonEdit(record.id);
      }
    },
    {
      key: "2",
      label: "Thiếp lập tiêu chí",
      icon: <IoMdAddCircleOutline />,
      onClick: () => {
        handleButtonAddAndUpdateCriteriaToEvaluation(record.id);
      }
    }
  ];

  const handleButtonAddNew = () => {
    setId(null);
    setIsOpenModalAdd(true);
  };

  const handleButtonEdit = (id) => {
    setId(id);
    setIsOpenModalEdit(true);
  };

  const handleButtonAddAndUpdateCriteriaToEvaluation = (id) => {
    setId(id);
    setIsOpenModalAddCriteriaToEvaluation(true);
  };

  const handleButtonSetting = (id) => {
    setId(id);
    setIsOpenModalSetting(true);
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
        const res = await removeEvaluation(selectedRowKeys);
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

  const columns = [
    {
      title: "Tên phiếu đánh giá",
      dataIndex: "evaluationName",
      key: "evaluationName",
      width: 300,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Thuộc đơn vị",
      dataIndex: "unitName",
      width: 250,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    },
    {
      title: "Ngày bắt đầu đánh giá",
      dataIndex: "fromDate",
      width: 60,
      render: (text, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          {text !== null ? dayjs(text).format("DD-MM-YYYY HH:mm") : null}
        </div>
      )
    },
    {
      title: "Ngày kết thúc đánh giá",
      dataIndex: "toDate",
      width: 80,
      render: (text, record) => (
        <div style={{ whiteSpace: "pre-wrap", width: "100%" }}>
          {text !== null ? dayjs(text).format("DD-MM-YYYY HH:mm") : null}
        </div>
      )
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
        <Dropdown menu={{ items: itemsMenuAction(record) }} trigger={["click"]}>
          <div style={{ cursor: "pointer" }}>
            <SettingOutlined style={{ fontSize: 20, paddingRight: 8 }} />
          </div>
        </Dropdown>
      )
    }
  ];

  const propsTable = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    columns: columns.map((item) => ({
      width: 60,
      align: "center",
      ...item
    })),
    rowSelection: rowSelection,
    loading: loading,
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
        title={"Thêm mới phiếu đánh giá"}
        open={isOpenModalAdd}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAdd(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <NewEvaluation
          evaluationSampleList={dataEvaluationSample}
          listUnit={arrayToTree(dataUnit)}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAdd}
        />
      </Modal>

      <Modal
        title={"Thêm mới kỳ đánh giá"}
        open={isOpenModalAddPeriods}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAddPeriods(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <NewAndUpdateEvaluationPeriods
          listUnit={arrayToTree(dataUnit)}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAddPeriods}
          id={null}
        />
      </Modal>

      <Modal
        title={"Thêm kỳ đánh giá vào phiếu đánh giá"}
        open={isOpenModalUpdateTimeType}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalUpdateTimeType(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <UpdateTimeTypeToEvaluation
          evaluationIds={selectedRowKeys}
          listCategoryTimeType={dataCategoryTimeType}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalUpdateTimeType}
          setSelectedRowKeys={setSelectedRowKeys}
        />
      </Modal>

      <Modal
        title={"Chỉnh sửa phiếu đánh giá"}
        open={isOpenModalEdit}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalEdit(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <EditEvaluation
          id={id}
          listUnit={arrayToTree(dataUnit)}
          listCategoryTimeType={dataCategoryTimeType}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalEdit}
        />
      </Modal>

      <Modal
        title={"Thêm hoặc chỉnh sửa tiêu chí trong phiếu đánh giá"}
        open={isOpenModalAddCriteriaToEvaluation}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAddCriteriaToEvaluation(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={1600}
      >
        <AddAndUpdateCriteriaToEvaluation
          id={id}
          listCategoryCriteria={arrayToTree(dataCategoryCriteria)}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAddCriteriaToEvaluation}
        />
      </Modal>

      <Modal
        title={"Thêm hoặc chỉnh sửa tiêu chí trong danh sách các phiếu đánh giá"}
        open={isOpenModalAddCriteriaToListEvaluation}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalAddCriteriaToListEvaluation(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={1600}
      >
        <AddAndUpdateCriteriaToListEvaluation
          listEvaluationId={selectedRowKeys}
          listCategoryCriteria={arrayToTree(dataCategoryCriteria)}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAddCriteriaToListEvaluation}
          setSelectedRowKeysCallBack={setSelectedRowKeys}
        />
      </Modal>

      <Modal
        title={"Cấu hình phiếu đánh giá"}
        open={isOpenModalSetting}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalSetting(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={1600}
      >
        <SettingEvaluation
          // listEvaluationId={selectedRowKeys}
          // listCategoryCriteria={arrayToTree(dataCategoryCriteria)}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalSetting}
          setSelectedRowKeysCallBack={setSelectedRowKeys}
          id={id}
        />
      </Modal>

      <Breadcrumbs />

      <Divider />

      <Row gutter={[24, 0]}>
        <Col xs={24} sm={24} md={24} lg={24} xl={24} className="mb-24">
          <Space
            style={{
              marginBottom: 16
            }}
            wrap
          >
            <Button
              type="primary"
              onClick={handleButtonAddNew}
              loading={loading}
              style={{ borderRadius: 10, fontSize: 12, height: 40, padding: "0 15px" }}
              icon={<IoMdAddCircle style={{ paddingTop: 2, fontSize: 18 }} />}
            >
              Thêm mới phiếu đánh giá
            </Button>
            <Button
              type="primary"
              onClick={() => {
                setIsOpenModalAddPeriods(true);
              }}
              loading={loading}
              style={{ borderRadius: 10, fontSize: 12, height: 40, padding: "0 15px" }}
              icon={<GoClockFill style={{ paddingTop: 2, fontSize: 18 }} />}
            >
              Thêm mới Kỳ đánh giá
            </Button>
            <Popconfirm
              title="Bạn có chắc chắn muốn thêm tiêu chí cho các mục này không ?"
              okText="Có"
              cancelText="Không"
              disabled={!hasSelected}
              onConfirm={() => {
                setIsOpenModalAddCriteriaToListEvaluation(true);
              }}
            >
              <Button
                style={hasSelected ? { backgroundColor: "#4CAF50", color: "#fff" } : undefined} // Thay đổi màu nền và màu chữ
                type="primary"
                loading={loading}
                disabled={!hasSelected}
                icon={<SettingOutlined />}
              >
                Thiết lập tiêu chí cho {selectedRowKeys.length} mục
              </Button>
            </Popconfirm>

            <Popconfirm
              title="Bạn có chắc chắn muốn thêm kỳ đánh giá cho các mục này không ?"
              okText="Có"
              cancelText="Không"
              disabled={!hasSelected}
              onConfirm={() => {
                setIsOpenModalUpdateTimeType(true);
              }}
            >
              <Button
                style={hasSelected ? { backgroundColor: "#4c8caf", color: "#fff" } : undefined} // Thay đổi màu nền và màu chữ
                type="primary"
                loading={loading}
                disabled={!hasSelected}
                icon={<SettingOutlined />}
              >
                Thiết lập kỳ đánh giá cho {selectedRowKeys.length} mục
              </Button>
            </Popconfirm>

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
          </Space>

          <Card bordered={false} className="criclebox">
            <Table {...propsTable} />
          </Card>
        </Col>
      </Row>
    </Spin>
  );
};

export default Evaluation;
