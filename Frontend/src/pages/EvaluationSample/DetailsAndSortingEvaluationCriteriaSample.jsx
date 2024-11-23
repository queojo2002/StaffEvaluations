import { useEffect, useState } from "react";
import { CheckCircleOutlined, ReloadOutlined } from "@ant-design/icons";
import { DndContext, PointerSensor, useSensor, useSensors } from "@dnd-kit/core";
import { restrictToVerticalAxis } from "@dnd-kit/modifiers";
import { arrayMove, SortableContext, useSortable, verticalListSortingStrategy } from "@dnd-kit/sortable";
import { CSS } from "@dnd-kit/utilities";
import { Alert, Button, Col, Divider, Form, Row, Space, Spin, Table } from "antd";

import {
  getListCriteriaByIdEvaluation,
  getListCriteriaByIdEvaluationSample,
  updateSortEvaluation,
  updateSortEvaluationCriteriaSample
} from "~/apis";
import { renderTreeCriteria } from "~/pages/EvaluationCriteria/NewAndUpdateEvaluationCriteria";
import arrayToTree from "~/utils/arrayToTree";
import { listItemBeforeStyle, listItemStyle, listStyle } from "~/utils/styleCustom";

const DetailsAndSortingEvaluationCriteriaSample = (props) => {
  const { evaluationSampleId } = props;

  const [loading, setLoading] = useState(false);
  const [data, setData] = useState([]);

  const fetchById = async (evaluationSampleId) => {
    setLoading(true);
    const res = await getListCriteriaByIdEvaluationSample(evaluationSampleId);
    setData(updateOrder(arrayToTree(res.dataList)));
    setLoading(false);
  };

  const updateOrder = (nodes, prefix = "") => {
    return nodes.map((node, index) => {
      const currentOrder = `${prefix}${index + 1}`;
      const updatedNode = {
        ...node,
        order: currentOrder,
        children: node.children ? updateOrder(node.children, `${currentOrder}.`) : []
      };
      return updatedNode;
    });
  };

  const getFlatData = (nodes, result = []) => {
    for (const node of nodes) {
      result.push(node);
      if (node.children) {
        getFlatData(node.children, result);
      }
    }
    return result;
  };

  const sensors = useSensors(
    useSensor(PointerSensor, {
      activationConstraint: {
        distance: 1
      }
    })
  );

  const RowDrag = (props) => {
    const { attributes, listeners, setNodeRef, transform, transition, isDragging } = useSortable({
      id: props["data-row-key"]
    });
    const style = {
      ...props.style,
      transform: CSS.Translate.toString(transform),
      transition,
      cursor: "move",
      ...(isDragging ? { position: "relative", zIndex: 9999 } : {})
    };

    return <tr {...props} ref={setNodeRef} style={style} {...attributes} {...listeners} />;
  };

  const onDragEnd = ({ active, over }) => {
    if (active.id !== over?.id) {
      setData((prev) => {
        const updateNodeChildren = (nodes, activeId, overId) => {
          return nodes.map((node) => {
            if (node.children) {
              const activeIndex = node.children.findIndex((c) => c.id === activeId);
              const overIndex = node.children.findIndex((c) => c.id === overId);
              if (activeIndex >= 0 && overIndex >= 0) {
                const updatedChildren = arrayMove(node.children, activeIndex, overIndex);
                return { ...node, children: updatedChildren };
              }
              return { ...node, children: updateNodeChildren(node.children, activeId, overId) };
            }
            return node;
          });
        };

        const activeRootIndex = prev.findIndex((i) => i.id === active.id);
        const overRootIndex = prev.findIndex((i) => i.id === over?.id);
        let newData;
        if (activeRootIndex >= 0 && overRootIndex >= 0) {
          newData = arrayMove(prev, activeRootIndex, overRootIndex);
        } else {
          newData = updateNodeChildren(prev, active.id, over?.id ?? "");
        }

        // Cập nhật thứ tự sau khi di chuyển
        return updateOrder(newData);
      });
    }
  };

  const columns = [
    {
      key: "sort",
      dataIndex: "order",
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
    loading: loading,
    dataSource: data ? renderTreeCriteria(data) : null,
    pagination: false,
    size: "middle",
    components: {
      body: {
        row: RowDrag
      }
    }
  };

  const onFinish = async () => {
    const flatData = getFlatData(data);
    const order = flatData.map((item, index) => ({
      categoryCriteriaId: item.id,
      sort: index + 1
    }));

    const res = await updateSortEvaluationCriteriaSample({
      evaluationSampleId: evaluationSampleId,
      listCategoryCriterias: order
    });

    if (res.isSuccess) {
    }
  };

  useEffect(() => {
    if (evaluationSampleId) {
      fetchById(evaluationSampleId);
    }
  }, [evaluationSampleId]);

  return (
    <Spin spinning={loading}>
      <Row gutter={16}>
        <Col span={24}>
          <DndContext sensors={sensors} modifiers={[restrictToVerticalAxis]} onDragEnd={onDragEnd}>
            <SortableContext
              items={data.flatMap((node) => [node.id, ...node.children.map((child) => child.id)])}
              strategy={verticalListSortingStrategy}
            >
              <Table
                {...propsTable}
                expandIconColumnIndex={1}
                title={() => (
                  <Alert
                    message="Mô tả"
                    description={
                      <ul style={listStyle}>
                        <li style={listItemStyle}>
                          <span style={listItemBeforeStyle}>- </span>Bạn có thể sắp xếp các tiêu chí bằng cách di chuyển
                          chúng và nhấn nút &quot;Lưu thao tác&quot; để hoàn tất việc sắp xếp.
                        </li>
                      </ul>
                    }
                    type="info"
                    showIcon
                    style={{ marginBottom: 16 }}
                  />
                )}
              />
            </SortableContext>
          </DndContext>
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
              <Button type="default" htmlType="reset" loading={loading} icon={<ReloadOutlined />}>
                Tải lại
              </Button>
              <Button
                type="primary"
                htmlType="submit"
                loading={loading}
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
  );
};

export default DetailsAndSortingEvaluationCriteriaSample;
