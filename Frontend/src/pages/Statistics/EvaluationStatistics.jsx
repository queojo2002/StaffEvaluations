import { useEffect, useState } from "react";
import { GrSearch } from "react-icons/gr";
import { IoFilterSharp } from "react-icons/io5";
import { FileExcelOutlined, FilePdfOutlined, FileWordOutlined } from "@ant-design/icons";
import { Button, Card, Divider, Flex, Input, Spin, Table, Tooltip, Typography } from "antd";
import dayjs from "dayjs";

import { exportAnalystConsolidationAndTransfer, getAllEvaluationConsolidationAndTransferCompleted } from "~/apis";
import Breadcrumbs from "~/components/Breadcrumbs";

const EvaluationStatistics = () => {
  const { Text } = Typography;

  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState([]);

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAllEvaluationConsolidationAndTransferCompleted();
    setDatas(data1.dataList);
    setLoading(false);
  };

  const onSelectChange = (newSelectedRowKeys) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection = {
    selectedRowKeys,
    onChange: onSelectChange
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
      title: "Tên đợt tổng hợp và chuyển",
      dataIndex: "evaluationConsolidationAndTransferName",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Thuộc đơn vị",
      dataIndex: "unitName",
      render: (text) => <Text>{text}</Text>
    },
    {
      title: "Ngày tổng hợp và chuyển",
      dataIndex: "updatedAt",
      width: "20%",
      render: (updatedAt) => (
        <div style={{ whiteSpace: "break-spaces", width: "100%" }}>{dayjs(updatedAt).format("DD-MM-YYYY HH:mm")}</div>
      )
    },
    {
      title: "Hành động",
      dataIndex: "action",
      width: "20%",
      render: (text, record) => (
        <>
          <Button
            onClick={() => {
              downloadAnalystExportFile(record.id, 1);
            }}
            type="default"
            size="middle"
            icon={<FileWordOutlined />}
            style={{ marginRight: "8px" }}
          >
            WORD
          </Button>
          <Button
            onClick={() => {
              downloadAnalystExportFile(record.id, 2);
            }}
            type="default"
            size="middle"
            icon={<FilePdfOutlined />}
            style={{ marginRight: "8px" }}
          >
            PDF
          </Button>
          <Button
            onClick={() => {
              downloadAnalystExportFile(record.id, 3);
            }}
            type="default"
            size="middle"
            icon={<FileExcelOutlined />}
          >
            Excel
          </Button>
        </>
      )
    }
  ];

  const propsTable = {
    scroll: {
      x: 800
    },
    rowKey: "id",
    rowSelection: rowSelection,
    columns: columns.map((item) => ({
      width: 130,
      align: "center",
      ...item
    })),
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
      <Breadcrumbs />
      <Divider />
      <Flex gap="middle" vertical>
        <Flex align="center" gap={10} justify="space-between" style={{ width: "100%" }}>
          <Flex align="center" gap={5} justify="flex-start">
            {/* <Button
              type="primary"
              onClick={handleButtonAddNew}
              loading={loading}
              style={{ borderRadius: 10, fontSize: 12, height: 40, padding: "0 15px" }}
              icon={<IoMdAddCircle style={{ paddingTop: 2, fontSize: 18 }} />}
            >
              Tạo mới đợt Tổng hợp và chuyển
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
            </Button> */}
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

export default EvaluationStatistics;
