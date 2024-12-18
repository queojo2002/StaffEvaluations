import { useEffect, useState } from "react";
import { FileWordOutlined, SearchOutlined } from "@ant-design/icons";
import { Button, Card, Col, DatePicker, Divider, Form, Row, Select, Space, Spin, Table, Tag, Typography } from "antd";
import dayjs from "dayjs";

import { analystOfUnit, analystOfUser, exportAnalystConsolidationAndTransfer, getAllUnit, getAllUser } from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";
import { getGradingName } from "~/utils/getGradingName";

const StatisticsUser = () => {
  const { Text, Title } = Typography;
  const [formRef] = Form.useForm();

  const [loading, setLoading] = useState(false);
  const [isHideTable, setIsHideTable] = useState(false);
  const [datas, setDatas] = useState([]);
  const [users, setUsers] = useState([]);

  const [dataAll, setDataAll] = useState([]);

  const [dataUnit, setDataUnit] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAllUser();
    const data2 = await getAllUnit();
    setUsers(data1.dataList);
    setDataUnit(data2.dataList);
    setLoading(false);
  };

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const downloadAnalystExportFile = async (id, numberTemplate) => {
    setLoading(true);

    try {
      const res = await exportAnalystConsolidationAndTransfer(id, numberTemplate);

      if (res.size === 0) {
        alert("Mẫu đánh giá phải gửi cấp phê duyệt mới được in ấn.");
        setLoading(false);
        return;
      }

      const data = res;

      if (numberTemplate === 1 || numberTemplate === 3) {
        const file = new Blob([data]);
        const a = document.createElement("a");
        a.href = window.URL.createObjectURL(file);
        if (numberTemplate === 1) {
          a.download = "Report.docx";
        } else if (numberTemplate === 3) {
          a.download = "Report.xlsx";
        }
        a.click();
      } else {
        const file = new Blob([data], { type: "application/pdf" });
        const fileURL = window.URL.createObjectURL(file);
        window.open(fileURL, "_blank");
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  const columns = [
    {
      title: "Tên phiếu",
      dataIndex: "evaluationName",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Thuộc đơn vị",
      dataIndex: "unitName",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Họ và tên",
      dataIndex: "fullName",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Điểm tự đánh giá",
      dataIndex: "assessmentValue",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Điểm cấp trên đánh giá",
      dataIndex: "assessmentValueSupervisor",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Mức xếp loại",
      dataIndex: "gradingName",
      render: (text, record) => {
        const gradingInfo = getGradingName(record.assessmentValueSupervisor);
        return <Tag color={gradingInfo.color}>{gradingInfo.name}</Tag>;
      }
    }
  ];

  const onFinish = async (values) => {
    setIsHideTable(false);
    setLoading(true);

    const res = await analystOfUser({
      ...values,
      startTime: dayjs(values.startTime).format("YYYY-MM-DD"),
      endTime: dayjs(values.endTime).format("YYYY-MM-DD")
    });

    if (res.isSuccess) {
      setIsHideTable(true);
      setDatas(res.data.analystOfUnitsRespons);
      setDataAll(res.data);
    }

    setLoading(false);
  };

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
    dataSource: datas,
    pagination: { pageSize: 10, showSizeChanger: false },
    bordered: true,
    size: "middle"
    // title: () => {
    //   // Tính toán các thống kê từ dữ liệu
    //   const totalPhieuDanhGia = dataAll.totalEvaluation || 0;
    //   const totalNguoiThamGia = dataAll.totalUser || 0;
    //   const totalHTXSNV = dataAll.totalHTXSNV || 0;
    //   const totalHTTNV = dataAll.totalHTTNV || 0;
    //   const totalHTNV = dataAll.totalHTNV || 0;
    //   const totalKHTNV = dataAll.totalKHTNV || 0;

    //   const totalAccounts = totalHTXSNV + totalHTTNV + totalHTNV + totalKHTNV;

    //   const percentHTXSNV = totalAccounts !== 0 ? ((totalHTXSNV / totalAccounts) * 100).toFixed(2) : 0;
    //   const percentHTTNV = totalAccounts !== 0 ? ((totalHTTNV / totalAccounts) * 100).toFixed(2) : 0;
    //   const percentHTNV = totalAccounts !== 0 ? ((totalHTNV / totalAccounts) * 100).toFixed(2) : 0;
    //   const percentKHTNV = totalAccounts !== 0 ? ((totalKHTNV / totalAccounts) * 100).toFixed(2) : 0;

    //   const chartData = [
    //     { type: "HTXSNV", value: totalHTXSNV, percentage: percentHTXSNV },
    //     { type: "HTTNV", value: totalHTTNV, percentage: percentHTTNV },
    //     { type: "HTNV", value: totalHTNV, percentage: percentHTNV },
    //     { type: "KHTNV", value: totalKHTNV, percentage: percentKHTNV }
    //   ];

    //   const chartConfig = {
    //     appendPadding: 10,
    //     data: chartData,
    //     angleField: "value",
    //     colorField: "type",
    //     radius: 0.8,
    //     label: {
    //       type: "outer",
    //       content: "{name} {percentage}%"
    //     },
    //     interactions: [{ type: "element-active" }]
    //   };

    //   return (
    //     <div style={{ padding: "10px" }}>
    //       <Row gutter={16}>
    //         <Col span={12}>
    //           <Title level={5}>Thông tin thống kê</Title>
    //           <ul>
    //             <li style={{ paddingBottom: 10 }}>Tổng số phiếu đánh giá: {totalPhieuDanhGia}</li>
    //             <li style={{ paddingBottom: 10 }}>Tổng số người tham gia: {totalNguoiThamGia}</li>
    //             <li style={{ paddingBottom: 10 }}>
    //               Số lượng HTXSNV: {totalHTXSNV} ({percentHTXSNV}%)
    //             </li>
    //             <li style={{ paddingBottom: 10 }}>
    //               Số lượng HTTNV: {totalHTTNV} ({percentHTTNV}%)
    //             </li>
    //             <li style={{ paddingBottom: 10 }}>
    //               Số lượng HTNV: {totalHTNV} ({percentHTNV}%)
    //             </li>
    //             <li style={{ paddingBottom: 10 }}>
    //               Số lượng KHTNV: {totalKHTNV} ({percentKHTNV}%)
    //             </li>
    //           </ul>
    //         </Col>
    //         <Col span={12}>
    //           <Pie {...chartConfig} />
    //         </Col>
    //       </Row>
    //     </div>
    //   );
    // }
  };

  useEffect(() => {
    fetchApiGetAll();
  }, []);

  return (
    <Spin spinning={loading}>
      <Breadcrumbs />
      <Divider />
      <Space direction="vertical" style={{ width: "100%" }}>
        <Card bordered={false} className="criclebox" style={{ width: "100%" }}>
          <Form layout={"vertical"} form={formRef} onFinish={onFinish}>
            <Row gutter={16}>
              <Col span={24}>
                <Form.Item name={"userId"} label="Chọn người dùng">
                  <Select
                    allowClear
                    showSearch
                    placeholder={"Chọn người dùng"}
                    options={users?.map((item) => ({
                      value: item.id,
                      label: item.fullName + " - " + item.email + " - " + item.userTypeName
                    }))}
                    style={{ height: 40, width: "100%" }}
                  />
                </Form.Item>
              </Col>
              <Col span={12}>
                <Form.Item name={"startTime"} label="Từ thời gian">
                  <DatePicker
                    style={{ height: 40, width: "100%" }}
                    placeholder="Chọn thời gian bắt đầu"
                    format="DD/MM/YYYY"
                  />
                </Form.Item>
              </Col>
              <Col span={12}>
                <Form.Item name={"endTime"} label="Đến thời gian">
                  <DatePicker
                    style={{ height: 40, width: "100%" }}
                    placeholder="Chọn thời gian kết thúc"
                    format="DD/MM/YYYY"
                  />
                </Form.Item>
              </Col>

              <Col span={24}>
                <Form.Item>
                  <Space
                    style={{
                      width: "100%",
                      justifyContent: "center"
                    }}
                  >
                    <Button
                      type="default"
                      htmlType="submit"
                      loading={loading}
                      icon={<SearchOutlined />}
                      style={{
                        backgroundColor: "#009900",
                        color: "#fff"
                      }}
                    >
                      Thống kê
                    </Button>

                    <Button
                      type="primary"
                      htmlType="reset"
                      loading={loading}
                      icon={<FileWordOutlined />}
                      style={{
                        float: "right"
                      }}
                    >
                      In báo cáo
                    </Button>
                  </Space>
                </Form.Item>
              </Col>
            </Row>
          </Form>
        </Card>
        {isHideTable === true ? (
          <Card bordered={false} className="criclebox">
            <Table {...propsTable} />
          </Card>
        ) : null}
      </Space>
    </Spin>
  );
};

export default StatisticsUser;
