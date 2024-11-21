import { useEffect, useState } from "react";
import { ArrowDownOutlined, ArrowUpOutlined } from "@ant-design/icons";
import { Alert, Button, Col, Row, Space, Spin, Table } from "antd";
import dayjs from "dayjs";

import {
  getAllCATEvaluationAvailable,
  getAllCATEvaluationsByConsolidationId,
  insertEvaluationIntoCATD,
  insertUserIntoEvaluation,
  removeEvaluationFromCATD,
  removeUserFromEvaluation
} from "~/apis";
import { listItemBeforeStyle, listItemStyle, listStyle } from "~/utils/styleCustom";
const EvaluationConsolidationAndTransferDetails = (props) => {
  const { id } = props;

  const [selectedRowKeysAdd, setSelectedRowKeysAdd] = useState([]);
  const [selectedRowKeysRemove, setSelectedRowKeysRemove] = useState([]);
  const [dataOne, setDataOne] = useState([]);
  const [dataTwo, setDataTwo] = useState([]);
  const [loading, setLoading] = useState(false);
  const hasSelectedAdd = selectedRowKeysAdd.length > 0;
  const hasSelectedRemove = selectedRowKeysRemove.length > 0;

  const fetchApiGetAll = async (id) => {
    setLoading(true);

    try {
      const [data1, data2] = await Promise.all([
        getAllCATEvaluationAvailable(id),
        getAllCATEvaluationsByConsolidationId(id)
      ]);

      setDataOne(data1.dataList);
      setDataTwo(data2.dataList);
    } catch (error) {
      openNotificationTopLeft("error", "Thông báo lỗi!", error);
    } finally {
      setLoading(false);
    }
  };

  const onSelectChangeAdd = (newSelectedRowKeys) => {
    setSelectedRowKeysAdd(newSelectedRowKeys);
  };

  const onSelectChangeRemove = (newSelectedRowKeys) => {
    setSelectedRowKeysRemove(newSelectedRowKeys);
  };

  const rowSelectionAdd = {
    selectedRowKeys: selectedRowKeysAdd,
    onChange: onSelectChangeAdd
  };

  const rowSelectionRemove = {
    selectedRowKeys: selectedRowKeysRemove,
    onChange: onSelectChangeRemove
  };

  const onFinish = async (type) => {
    setLoading(true);

    setSelectedRowKeysRemove([]);
    setSelectedRowKeysAdd([]);

    const res = type
      ? await insertEvaluationIntoCATD({
          evaluationConsolidationAndTransferId: id,
          evaluationIds: selectedRowKeysAdd
        })
      : await removeEvaluationFromCATD({
          evaluationConsolidationAndTransferId: id,
          evaluationIds: selectedRowKeysRemove
        });

    if (res.isSuccess) {
      await fetchApiGetAll(id);
    }

    setLoading(false);
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
    }
  ];

  const propsTableAdd = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelectionAdd,
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    loading: loading,
    dataSource: dataOne,
    pagination: { pageSize: 5, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  const propsTableRemove = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelectionRemove,
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
    loading: loading,
    dataSource: dataTwo,
    pagination: { pageSize: 5, showSizeChanger: false },
    bordered: true,
    size: "middle"
  };

  useEffect(() => {
    if (id) {
      fetchApiGetAll(id);
    }
  }, [id]);

  return (
    <Spin spinning={loading}>
      <Row gutter={(16, 24)}>
        <Col span={24}>
          <Alert
            message="Lưu ý"
            description={
              <ul style={listStyle}>
                <li style={listItemStyle}>
                  <span style={listItemBeforeStyle}>- </span>Danh sách người dùng có trong các phiếu đánh giá khi
                  &quot;Tổng hợp và chuyển&quot; khác nhau thì đợt &quot;Tổng hợp và chuyển&quot; đó mới có thể gửi đi.
                </li>
              </ul>
            }
            type="info"
            showIcon
            style={{ marginBottom: 16 }}
          />
        </Col>
        <Col span={24}>
          <Table {...propsTableAdd} />
        </Col>
        <Col
          span={24}
          style={{
            paddingTop: 10,
            paddingBottom: 10,
            textAlign: "center"
          }}
        >
          <Space>
            <Button
              onClick={() => {
                onFinish(1);
              }}
              disabled={!hasSelectedAdd}
              type="primary"
              icon={<ArrowDownOutlined />}
            >
              Thêm {selectedRowKeysAdd.length} phiếu đánh giá vào đợt Tổng hợp và chuyển
            </Button>
            <Button
              onClick={() => {
                onFinish(0);
              }}
              disabled={!hasSelectedRemove}
              type="primary"
              danger
              icon={<ArrowUpOutlined />}
            >
              Xoá {selectedRowKeysRemove.length} phiếu đánh giá khỏi đợt Tổng hợp và chuyển
            </Button>
          </Space>
        </Col>
        <Col span={24}>
          <Table {...propsTableRemove} />
        </Col>
      </Row>
    </Spin>
  );
};

export default EvaluationConsolidationAndTransferDetails;
