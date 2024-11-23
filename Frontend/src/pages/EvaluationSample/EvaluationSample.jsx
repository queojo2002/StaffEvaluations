import { useEffect, useState } from "react";
import { AiOutlineEdit } from "react-icons/ai";
import { BiEditAlt, BiSortAlt2 } from "react-icons/bi";
import { CiSettings } from "react-icons/ci";
import { GoClockFill } from "react-icons/go";
import { IoMdAddCircle, IoMdAddCircleOutline } from "react-icons/io";
import { RiDeleteBin2Fill } from "react-icons/ri";
import { ExclamationCircleFilled, SettingOutlined } from "@ant-design/icons";
import { Button, Card, Col, Divider, Dropdown, Modal, Popconfirm, Row, Space, Spin, Table, Typography } from "antd";
import dayjs from "dayjs";

import AddAndUpdateCriteriaToEvaluation from "../Evaluation/AddAndUpdateCriteriaToEvaluation";

import DetailsAndSortingEvaluationCriteriaSample from "./DetailsAndSortingEvaluationCriteriaSample";
import NewAndUpdateEvaluationSample from "./NewAndUpdateEvaluationSample";

import {
  getAllCategoryCriteria,
  getAllCategoryTimeType,
  getAllEvaluation,
  getAllEvaluationSample,
  getAllUnit,
  removeEvaluation,
  removeEvaluationSample
} from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import arrayToTree from "~/utils/arrayToTree";
import { openNotificationTopLeft } from "~/utils/openNotification";

const EvaluationSample = () => {
  const { Text } = Typography;
  const { confirm } = Modal;

  const [id, setId] = useState(null);
  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [dataCategoryCriteria, setDataCategoryCriteria] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);
  const [isOpenModalNewAndUpdate, setIsOpenModalNewAndUpdate] = useState(false);
  const [isOpenModalEdit, setIsOpenModalEdit] = useState(false);
  const [isOpenModalSorting, setIsOpenModalSorting] = useState(false);
  const [isOpenModalAddCriteriaToEvaluation, setIsOpenModalAddCriteriaToEvaluation] = useState(false);

  const hasSelected = selectedRowKeys.length > 0;

  const fetchApiGetAll = async () => {
    setLoading(true);
    try {
      const [data1, data2] = await Promise.all([getAllEvaluationSample(), getAllCategoryCriteria()]);
      setDatas(data1.dataList);
      setDataCategoryCriteria(data2.dataList);
    } catch (error) {
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

  const handleButtonAddNew = () => {
    setId(null);
    setIsOpenModalNewAndUpdate(true);
  };

  const handleButtonEdit = (id) => {
    setId(id);
    setIsOpenModalNewAndUpdate(true);
  };

  const handleButtonAddAndUpdateCriteriaToEvaluation = (id) => {
    setId(id);
    setIsOpenModalAddCriteriaToEvaluation(true);
  };

  const handleButtonSorting = (id) => {
    setId(id);
    setIsOpenModalSorting(true);
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
        const res = await removeEvaluationSample(selectedRowKeys);
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

  const itemsMenuAction = (record) => [
    {
      key: "0",
      label: "Chỉnh sửa",
      icon: <BiEditAlt />,
      onClick: () => {
        handleButtonEdit(record.id);
      }
    },
    {
      key: "1",
      label: "Thiếp lập tiêu chí",
      icon: <IoMdAddCircleOutline />,
      onClick: () => {
        handleButtonAddAndUpdateCriteriaToEvaluation(record.id);
      }
    },
    {
      key: "2",
      label: "Sắp xếp tiêu chí",
      icon: <BiSortAlt2 />,
      onClick: () => {
        handleButtonSorting(record.id);
      }
    }
  ];

  const columns = [
    {
      title: "Tên mẫu phiếu đánh giá",
      dataIndex: "evaluationSampleName",
      key: "evaluationSampleName",
      width: 300,
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
        title={id ? "Chỉnh sửa mẫu phiếu đánh giá" : "Thêm mới mẫu phiếu đánh giá"}
        open={isOpenModalNewAndUpdate}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalNewAndUpdate(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={800}
      >
        <NewAndUpdateEvaluationSample id={id} refetchApi={fetchApiGetAll} closeModal={setIsOpenModalNewAndUpdate} />
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
          evaluationSampleId={id}
          listCategoryCriteria={arrayToTree(dataCategoryCriteria)}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalAddCriteriaToEvaluation}
        />
      </Modal>

      <Modal
        title={"Chi tiết tiêu chí"}
        open={isOpenModalSorting}
        onOk={() => {}}
        onCancel={() => {
          setIsOpenModalSorting(false);
        }}
        footer={null}
        style={{ top: 20 }}
        width={1600}
      >
        <DetailsAndSortingEvaluationCriteriaSample
          evaluationSampleId={id}
          refetchApi={fetchApiGetAll}
          closeModal={setIsOpenModalSorting}
        />
      </Modal>

      {/* <Modal
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
        <NewEvaluation listUnit={arrayToTree(dataUnit)} refetchApi={fetchApiGetAll} closeModal={setIsOpenModalAdd} />
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
      </Modal> */}

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
              Thêm mới mẫu phiếu đánh giá
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
          </Space>

          <Card bordered={false} className="criclebox">
            <Table {...propsTable} />
          </Card>
        </Col>
      </Row>
    </Spin>
  );
};

export default EvaluationSample;
