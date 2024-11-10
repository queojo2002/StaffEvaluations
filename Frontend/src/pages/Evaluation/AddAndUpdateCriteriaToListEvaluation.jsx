import { useState } from "react";
import { CheckCircleOutlined, ReloadOutlined } from "@ant-design/icons";
import { Alert, Button, Col, Divider, Form, Row, Space, Spin, Switch, Table } from "antd";

import { insertAndRemoveListEvaluationCriteria } from "~/apis";
import { renderTreeCriteria } from "~/pages/EvaluationCriteria/NewAndUpdateEvaluationCriteria";
import { listItemBeforeStyle, listItemStyle, listStyle } from "~/utils/styleCustom";

const AddAndUpdateCriteriaToListEvaluation = (props) => {
  const { listEvaluationId, refetchApi, closeModal, listCategoryCriteria, setSelectedRowKeysCallBack } = props;
  const [loading, setLoading] = useState(false);
  const [checkStrictly, setCheckStrictly] = useState(true);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const rowSelection = {
    selectedRowKeys,
    onChange: (selectedKeys) => {
      setSelectedRowKeys(selectedKeys);
    }
  };

  const columns = [
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
      width: 180,
      render: (text) => <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{text}</div>
    }
  ];

  const propsTable = {
    scroll: {
      x: "max-content",
      y: window.innerHeight - 500
    },
    bordered: true,
    rowKey: (record) => record.id,
    columns: columns.map((item) => ({
      ellipsis: true,
      width: 150,
      ...item
    })),
    rowSelection: {
      ...rowSelection,
      checkStrictly: checkStrictly
    },
    dataSource: renderTreeCriteria(listCategoryCriteria),
    pagination: false,
    size: "middle"
  };

  const onFinish = async () => {
    setLoading(true);

    const res = await insertAndRemoveListEvaluationCriteria({
      evaluationIds: listEvaluationId,
      listCategoryCriteriaId: selectedRowKeys
    });

    if (res.isSuccess) {
      refetchApi();
      closeModal(false);
      setCheckStrictly(true);
      setSelectedRowKeys([]);
      setSelectedRowKeysCallBack([]);
    }

    setLoading(false);
  };

  return (
    <div className="AddAndUpdateCriteriaToListListEvaluation">
      <Spin spinning={loading}>
        <Row gutter={16}>
          <Col span={24}>
            <Table
              {...propsTable}
              title={() => (
                <div>
                  <Alert
                    message="Mô tả"
                    description={
                      <ul style={listStyle}>
                        <li style={listItemStyle}>
                          <span style={listItemBeforeStyle}>- </span>Bạn có thể thêm các tiêu chí vào phiếu đánh giá
                          bằng cách chọn tiêu chí và nhấn nút &quot;Lưu thao tác&quot;.
                        </li>
                        <li style={listItemStyle}>
                          <span style={listItemBeforeStyle}>- </span>Bạn có thể xóa tiêu chí khỏi phiếu đánh giá bằng
                          cách bỏ chọn tiêu chí và nhấn nút &quot;Lưu thao tác&quot;.
                        </li>
                        <li style={listItemStyle}>
                          <span style={listItemBeforeStyle}>- </span>Lưu ý: Khi người dùng đã thực hiện đánh giá thì bạn
                          không thể thêm hoặc chỉnh sửa phiếu đánh giá này được nữa.
                        </li>
                      </ul>
                    }
                    type="info"
                    showIcon
                    style={{ marginBottom: 16 }}
                  />

                  <Space align="center" style={{ marginBottom: 16 }}>
                    Bật chế độ chọn từng hàng: <Switch checked={checkStrictly} onChange={setCheckStrictly} />
                  </Space>
                </div>
              )}
            />
          </Col>

          <Divider />

          <Col span={24}>
            <Form.Item>
              <Space
                style={{
                  width: "100%",
                  justifyContent: "flex-end"
                }}
              >
                <Button type="default" htmlType="reset" icon={<ReloadOutlined />}>
                  Tải lại
                </Button>
                <Button
                  type="primary"
                  htmlType="submit"
                  icon={<CheckCircleOutlined />}
                  style={{
                    float: "right"
                  }}
                  onClick={onFinish}
                >
                  Lưu thao tác
                </Button>
              </Space>
            </Form.Item>
          </Col>
        </Row>
      </Spin>
    </div>
  );
};

export default AddAndUpdateCriteriaToListEvaluation;
