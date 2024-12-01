import { useEffect, useRef, useState } from "react";
import { CloseOutlined, EditOutlined, SaveOutlined, SendOutlined } from "@ant-design/icons";
import { Button, Col, Drawer, Input, Modal, Row, Space, Table, Tabs, Tag, Typography } from "antd";

const EvaluationDetailsUserCustom = (props) => {
  const { isOpen, setIsOpen, evaluationId, userId, status, refetchApi } = props;

  const { Text } = Typography;

  const [loading, setLoading] = useState(false);

  const [criteriaData, setCriteriaData] = useState([]);
  const [supervisors, setSupervisors] = useState([]);

  // Hàm tính tổng điểm chuẩn các tiêu chí cha
  const calculateEndValue = (data) => {
    // console.log("Input data:", JSON.stringify(data, null, 2)); // Log dữ liệu đầu vào

    return data.map((item) => {
      // console.log(`Processing item: ${item.id}`);

      if (item.children && item.children.length > 0) {
        // console.log(`Item ${item.id} has children. Calculating for children...`);

        // Nếu có con, tính tổng điểm benchmark của con
        const updatedChildren = calculateEndValue(item.children);

        // console.log(`Updated children for item ${item.id}:`, JSON.stringify(updatedChildren, null, 2));

        // Tính tổng benchmark của các con
        const totalEndValue = updatedChildren.reduce((sum, child) => sum + child.endValue, 0);

        // console.log(`Total benchmark for item ${item.id}: ${totalBenchmark}`);

        // Cập nhật benchmark cho tiêu chí cha
        return {
          ...item,
          children: updatedChildren,
          endValue: totalEndValue
        };
      }

      // console.log(`Item ${item.id} has no children. Benchmark: ${item.benchmark}`);

      return item; // Nếu không có con, giữ nguyên
    });
  };

  // Hàm tính tổng điểm của tiêu chí cha
  const calculateTotal = (record, field, supervisorIndex) => {
    if (!record.children || record.children.length === 0) {
      if (field === "supervisors") {
        return record.supervisors[supervisorIndex]?.score || 0;
      }
      return record[field];
    }
    return record.children.reduce(
      (total, child) => total + calculateTotal(child, field, field === "supervisors" ? supervisorIndex : undefined),
      0
    );
  };

  // Hàm cập nhật điểm
  const handleInputChange = (id, field, value, supervisorIndex) => {
    const updateData = (data) =>
      data.map((item) => {
        if (item.id === id) {
          if (field === "supervisors") {
            const updatedSupervisors = [...item.supervisors];
            updatedSupervisors[supervisorIndex].score = parseFloat(value) || 0;
            return { ...item, supervisors: updatedSupervisors };
          }
          return { ...item, [field]: parseInt(value) || 0 };
        }
        if (item.children) {
          return { ...item, children: updateData(item.children) };
        }
        return item;
      });

    setCriteriaData(updateData(criteriaData));
  };

  // Hàm làm phẳng và lấy những phần tử không có tiêu chí con
  const flattenCriteriaData = (data) => {
    let flatData = []; // Khởi tạo một mảng mới để lưu trữ dữ liệu không có tiêu chí con.

    // Duyệt qua tất cả các phần tử trong mảng data
    for (let i = 0; i < data.length; i++) {
      const item = data[i]; // Lấy phần tử hiện tại trong mảng.

      // Log ra phần tử hiện tại
      // console.log("Đang xử lý phần tử:", item);

      // Kiểm tra xem phần tử có tiêu chí con hay không
      if (!item.children || item.children.length === 0) {
        // Nếu không có con, thêm phần tử vào mảng flatData
        // console.log("Phần tử không có con, thêm vào flatData:", item);
        flatData.push({
          id: item.id,
          criteriaName: item.criteriaName,
          parentId: item.parentId,
          benchmark: item.benchmark,
          userScore: item.userScore
        });
      }

      // Nếu phần tử có con, gọi đệ quy để làm phẳng các phần tử con
      if (item.children && item.children.length > 0) {
        // console.log("Phần tử có con, gọi đệ quy cho children:", item.children);

        const childrenFlattened = flattenCriteriaData(item.children); // Gọi đệ quy để làm phẳng các phần tử con.

        // Log kết quả đệ quy cho children
        // console.log("Kết quả làm phẳng cho children:", childrenFlattened);

        // Nối các phần tử con đã làm phẳng vào mảng flatData mà không dùng concat
        for (let j = 0; j < childrenFlattened.length; j++) {
          // console.log("Thêm phần tử vào flatData:", childrenFlattened[j]);
          flatData.push(childrenFlattened[j]);
        }
      }
    }

    // Log kết quả sau khi xử lý xong
    // console.log("Kết quả cuối cùng của flatData:", flatData);

    return flatData; // Trả về mảng đã làm phẳng
  };

  const onFinish = async () => {
    // Làm phẳng dữ liệu criteriaData và chỉ lấy các phần tử không có con
    const flattenedData = flattenCriteriaData(criteriaData);

    // Log dữ liệu đã làm phẳng để kiểm tra
    console.log("Dữ liệu đã làm phẳng:", flattenedData);

    // Gửi dữ liệu xuống backend (sử dụng API gọi vào đây)
    // await sendDataToBackend(flattenedData);  // Gọi API hoặc gửi dữ liệu
  };

  // Tạo cột cho Supervisor
  const supervisorColumns = supervisors.map((supervisor, index) => ({
    title: (
      <>
        <div>{supervisor.name}</div>
        <div style={{ fontSize: "12px", color: "gray" }}>{supervisor.unit}</div>
      </>
    ),
    key: `supervisor${index + 1}Score`,
    align: "center",
    render: (_, record) =>
      record.children && record.children.length > 0 ? (
        <Tag
          style={{
            width: "100%",
            textAlign: "center",
            height: 40,
            fontSize: 15,
            fontWeight: "bold",
            alignContent: "center"
          }}
        >
          {calculateTotal(record, "supervisors", index)}
        </Tag>
      ) : (
        <Tag style={{ width: "100%", textAlign: "center", height: 40, fontSize: 15, alignContent: "center" }}>
          {record.supervisors[index]?.score || 0}
        </Tag>
      )
  }));

  // Cấu hình các cột
  const columns = [
    {
      title: <div style={{ fontSize: 16 }}>Số thứ tự</div>,
      dataIndex: "criteriaName",
      key: "criteriaName",
      width: 80,
      align: "center",
      render: (text) => (
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            height: "100%",
            width: "100%"
          }}
        >
          {text}
        </div>
      )
    },
    {
      title: <div style={{ fontSize: 16 }}>Tiêu chí đánh giá</div>,
      dataIndex: "criteriaName",
      key: "criteriaName",
      align: "left",
      render: (text, record) => (
        <div
          style={{
            whiteSpace: "break-spaces",
            fontWeight: record.children?.length > 0 ? "bold" : "normal",
            fontSize: record.children?.length > 0 ? 16 : 15
          }}
        >
          {text}
        </div>
      )
    },
    {
      title: <div style={{ fontSize: 16 }}>Điểm chuẩn</div>,
      dataIndex: "endValue",
      key: "endValue",
      width: 100,
      render: (endValue) => (
        <Tag
          style={{
            width: "100%",
            textAlign: "center",
            height: 40,
            fontSize: 15,
            fontWeight: "bold",
            alignContent: "center"
          }}
        >
          {endValue}
        </Tag>
      )
    },
    {
      title: <div style={{ fontSize: 16 }}>Điểm tự đánh giá</div>,
      key: "userScore",
      width: 100,
      render: (_, record) =>
        record.children && record.children.length > 0 ? (
          <Tag
            style={{
              width: "100%",
              textAlign: "center",
              height: 40,
              fontSize: 15,
              fontWeight: "bold",
              alignContent: "center"
            }}
          >
            {calculateTotal(record, "userScore")}
          </Tag>
        ) : (
          <Input
            type="number"
            value={record.userScore}
            min={0}
            max={record.endValue}
            onChange={(e) => {
              let inputValue = e.target.value.trim();
              let parsedValue = parseInt(inputValue, 10);

              // Xử lý giá trị nhập vào:
              if (isNaN(parsedValue) || parsedValue < 0) {
                parsedValue = 0;
              } else if (parsedValue > record.endValue) {
                parsedValue = record.endValue;
              }

              handleInputChange(record.id, "userScore", parsedValue);
            }}
            style={{
              color: "blue",
              width: "100%",
              height: 40,
              justifyContent: "center",
              alignItems: "center",
              display: "inline-flex",
              textAlign: "left",
              fontSize: 15
            }}
          />
        )
    },
    ...supervisorColumns,
    {
      title: <div style={{ fontSize: 16 }}>Giải trình</div>,
      dataIndex: "id",
      key: "id",
      width: 80,
      render: (id, record) => (
        <Button
          icon={status === 2 ? <EditOutlined /> : <SaveOutlined />}
          style={{ fontSize: 14, width: 170, height: 40, color: "white", backgroundColor: "#1890ff" }}
          // onClick={() => {
          //   setNameCriteriaDisplay(record.stt + ". " + record.criteriaName);
          //   setExplaintCategoryCriteriaId(record.id);
          //   setIsOpenNewAndUpdateEvaluationExplaint(true);
          // }}
        >
          {status === 2 ? "Xem lại giải trình" : "Thêm giải trình"}
        </Button>
      )
    }
  ];

  const propsTable = {
    rowKey: (record) => record.id,
    loading: loading,
    columns: columns.map((item) => ({
      width: 150,
      align: "center",
      ...item
    })),
    bordered: true,
    expandable: {
      defaultExpandAllRows: true,
      expandIcon: () => null
    },
    dataSource: criteriaData,
    pagination: false,
    size: "middle"
  };

  useEffect(() => {
    setCriteriaData(
      calculateEndValue([
        {
          id: "1",
          criteriaName: "Tiêu chí 1",
          parentId: null,
          endValue: 0,
          userScore: 0,
          supervisors: [
            { name: "Supervisor A", unit: "Phòng 1", score: 0 },
            { name: "Supervisor B", unit: "Phòng 2", score: 0 }
          ],
          children: [
            {
              id: "1.1",
              criteriaName: "Tiêu chí 1.1",
              parentId: "1",
              endValue: 0,
              userScore: 0,
              supervisors: [
                { name: "Supervisor A", unit: "Phòng 1", score: 0 },
                { name: "Supervisor B", unit: "Phòng 2", score: 0 }
              ],
              children: [
                {
                  id: "1.1.1",
                  criteriaName: "Tiêu chí 1.1.1",
                  parentId: "1.1",
                  endValue: 20,
                  userScore: 0,
                  supervisors: [
                    { name: "Supervisor A", unit: "Phòng 1", score: 10 },
                    { name: "Supervisor B", unit: "Phòng 2", score: 15 }
                  ]
                },
                {
                  id: "1.1.2",
                  criteriaName: "Tiêu chí 1.1.2",
                  parentId: "1.1",
                  endValue: 30,
                  userScore: 0,
                  supervisors: [
                    { name: "Supervisor A", unit: "Phòng 1", score: 15 },
                    { name: "Supervisor B", unit: "Phòng 2", score: 10 }
                  ]
                }
              ]
            },
            {
              id: "1.2",
              criteriaName: "Tiêu chí 1.2",
              parentId: "1",
              endValue: 50,
              userScore: 0,
              supervisors: [
                { name: "Supervisor A", unit: "Phòng 1", score: 30 },
                { name: "Supervisor B", unit: "Phòng 2", score: 40 }
              ]
            }
          ]
        }
      ])
    );
    setSupervisors(criteriaData[0]?.supervisors || []);
  }, []);

  return (
    <>
      <Drawer
        onClose={() => {
          setIsOpen(false);
        }}
        open={isOpen}
        styles={{ header: { height: 60, backgroundColor: "#1890ff" } }}
        closeIcon={false}
        placement="right"
        width="100%"
        height="100%"
        title={
          <Row
            justify="space-between"
            style={{
              alignItems: "center",
              alignContent: "center"
            }}
          >
            <Col>
              <Text
                style={{
                  fontSize: 18,
                  color: "white"
                }}
              >
                Thực hiện đánh giá
              </Text>
            </Col>
            <Col>
              <CloseOutlined style={{ fontSize: 20 }} onClick={() => setIsOpen(false)} />
            </Col>
          </Row>
        }
        footer={
          <Space
            style={{
              width: "100%",
              height: 50,
              justifyContent: "flex-end"
            }}
          >
            <Button
              loading={loading}
              onClick={() => {
                setIsOpenEvaluationDetailsUserPrint(true);
              }}
              icon={<SaveOutlined />}
              style={{ fontSize: 14, width: 130, height: 40, color: "white", backgroundColor: "#1890ff" }}
            >
              Mẫu in ấn
            </Button>

            <Button
              hidden={status === 2 ? true : false}
              loading={loading}
              onClick={() => {
                setOpenSendEvaluation(true);
              }}
              icon={<SendOutlined />}
              style={{
                fontSize: 14,
                width: 150,
                height: 40,
                color: "white",
                backgroundColor: "#1890ff",
                background: "blueviolet",
                borderColor: "1890ff"
              }}
            >
              Gửi đánh giá
            </Button>
            <Button
              hidden={status === 2 ? true : false}
              loading={loading}
              onClick={() => {
                onFinish(1);
              }}
              icon={<SaveOutlined />}
              style={{ fontSize: 14, width: 130, height: 40, color: "white", backgroundColor: "#ff1346" }}
            >
              Lưu lại
            </Button>

            <Button
              loading={loading}
              onClick={() => setIsOpen(false)}
              icon={<CloseOutlined />}
              style={{
                fontSize: 14,
                width: 100,
                height: 40,
                color: "white",
                backgroundColor: "#1890ff",
                background: "cornflowerblue",
                borderColor: "1890ff"
              }}
            >
              Đóng
            </Button>
          </Space>
        }
        loading={loading}
      >
        <Table {...propsTable} />
      </Drawer>
    </>
  );
};

export default EvaluationDetailsUserCustom;
