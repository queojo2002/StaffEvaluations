import { useEffect, useState } from "react";
import { BookOutlined, DeploymentUnitOutlined, NotificationOutlined, UserOutlined } from "@ant-design/icons";
import { Pie } from "@ant-design/plots";
import { Column } from "@ant-design/plots";
import { Badge, Card, Col, Row, Skeleton, Spin, Typography } from "antd";

import { getAnalyst } from "~/apis";

const Dashboard = () => {
  const { Title } = Typography;
  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);
  const [data, setData] = useState([]);
  const [configTwo, setConfigTwo] = useState({});

  const config = {
    data,
    angleField: "value",
    colorField: "type",
    label: {
      text: "value",
      style: {
        fontWeight: "bold"
      }
    },
    legend: {
      color: {
        title: false,
        position: "right",
        rowPadding: 3
      }
    }
  };

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAnalyst();
    setDatas(data1);
    setData([
      { type: "Hoàn thành xuất sắc nhiệm vụ", value: data1.totalNowHTXSNV },
      { type: "Hoàn thành tốt nhiệm vụ", value: data1.totalNowHTTNV },
      { type: "Hoàn thành nhiệm vụ", value: data1.totalNowHTNV },
      { type: "Không hoàn thành nhiệm vụ", value: data1.totalNowKHTNV },
      { type: "Chưa hoàn thành/thực hiện", value: data1.totalNowChuaThuchienHoanThanh }
    ]);
    setConfigTwo({
      data: data1.analystColumns,
      xField: "month",
      yField: "total",
      colorField: "name",
      group: true,
      style: {
        inset: 5
      }
    });
    setLoading(false);
  };

  useEffect(() => {
    fetchApiGetAll();
  }, []);

  return (
    <>
      <div className="layout-content">
        <Row gutter={[24, 0]}>
          {/*<Col xs={24} md={24} sm={24} lg={24} xl={24} className="mb-24">*/}
          {/*  <ToDoListDragAndDrop />*/}
          {/*</Col>*/}

          <Col xs={24} md={24} sm={24} lg={24} xl={24} className="mb-24">
            <Card bordered={false} className="criclebox card-info-2 h-full">
              <div
                className="gradent h-full col-content"
                style={{
                  background: "linear-gradient(to right, #1f4037, #99f2c8)"
                }}
              >
                <div className="card-content">
                  <Title level={5}>
                    Thông báo <NotificationOutlined />{" "}
                  </Title>
                  <Spin spinning={false}>
                    <p
                      style={{
                        fontStyle: "italic"
                      }}
                    >
                      Chưa có thông báo nào...
                    </p>
                    {/* <p
                          style={{
                            fontStyle: "italic"
                          }}
                        >
                          Bạn đang có{" "}
                          <span
                            style={{
                              fontWeight: "bold",
                              color: "#00FECC"
                            }}
                          >
                            {ListEvaluationsOfUser?.listPayload?.length
                              ? ListEvaluationsOfUser?.listPayload
                                  ?.map((item) => (item.status === 0 || item.status === 1 ? 1 : 0))
                                  ?.reduce<number>((total, current) => total + current, 0)
                              : 0}{" "}
                          </span>
                          phiếu tự đánh giá đang chờ bạn đánh giá
                        </p> */}

                    {/* <p
                          style={{
                            fontStyle: "italic"
                          }}
                        >
                          Bạn đang có{" "}
                          <span
                            style={{
                              fontWeight: "bold",
                              color: "#00FECC"
                            }}
                          >
                            {ListEvaluationsOfSupervisor?.listPayload?.length
                              ? ListEvaluationsOfSupervisor?.listPayload
                                  ?.map((item) => (item.status === 0 || item.status === 1 ? 1 : 0))
                                  ?.reduce<number>((total, current) => total + current, 0)
                              : 0}{" "}
                          </span>
                          phiếu đánh giá của cấp dưới đang chờ bạn đánh giá và xét duyệt
                        </p> */}
                  </Spin>
                </div>
                {/* <div className="card-footer">*/}
                {/*  <a className="icon-move-right">*/}
                {/*    Read More*/}
                {/*    <RightOutlined />*/}
                {/*  </a>*/}
                {/*</div> */}
              </div>
            </Card>
          </Col>

          <Col xs={24} sm={24} md={12} lg={8} xl={8} className="mb-24">
            <Card bordered={false} className="criclebox ">
              <div className="number">
                <Skeleton active loading={loading}>
                  <Row align="middle" gutter={[24, 0]}>
                    <Col xs={18}>
                      <span>Tổng số phiếu đánh giá của đơn vị</span>
                      <Title level={3}>{datas.totalEvaluations}</Title>
                    </Col>
                    <Col xs={6}>
                      <div className="icon-box">
                        <BookOutlined />
                      </div>
                    </Col>
                  </Row>
                </Skeleton>
              </div>
            </Card>
          </Col>

          <Col xs={24} sm={24} md={12} lg={8} xl={8} className="mb-24">
            <Card bordered={false} className="criclebox ">
              <div className="number">
                <Skeleton active loading={loading}>
                  <Row align="middle" gutter={[24, 0]}>
                    <Col xs={18}>
                      <span>Tổng số người dùng của đơn vị</span>
                      <Title level={3}>{datas.totalUser}</Title>
                    </Col>
                    <Col xs={6}>
                      <div className="icon-box">
                        <UserOutlined />
                      </div>
                    </Col>
                  </Row>
                </Skeleton>
              </div>
            </Card>
          </Col>

          <Col xs={24} sm={24} md={12} lg={8} xl={8} className="mb-24">
            <Card bordered={false} className="criclebox ">
              <div className="number">
                <Skeleton active loading={loading}>
                  <Row align="middle" gutter={[24, 0]}>
                    <Col xs={18}>
                      <span>Tổng số đơn vị/phòng ban</span>
                      <Title level={3}>{datas.totalUnit}</Title>
                    </Col>
                    <Col xs={6}>
                      <div className="icon-box">
                        <DeploymentUnitOutlined />
                      </div>
                    </Col>
                  </Row>
                </Skeleton>
              </div>
            </Card>
          </Col>
        </Row>

        <Row gutter={[24, 0]} style={{ display: "flex", alignItems: "stretch" }}>
          <Col
            xs={24}
            sm={24}
            md={24}
            lg={24}
            xl={24}
            style={{ display: "flex", flexDirection: "column" }}
            className="mb-24"
          >
            <Spin size="large" spinning={false}>
              <Badge.Ribbon text="Mới" color="red">
                <Card bordered={false} className="criclebox h-full" style={{ flex: 1 }}>
                  <Title level={5}>Biểu đồ thống kê tình hình xếp loại gần nhất của đơn vị</Title>
                  {<Pie {...config} />}
                </Card>
              </Badge.Ribbon>
            </Spin>
          </Col>

          <Col
            xs={24}
            sm={24}
            md={24}
            lg={24}
            xl={24}
            style={{ display: "flex", flexDirection: "column" }}
            className="mb-24"
          >
            <Spin size="large" spinning={false}>
              <Badge.Ribbon text="Mới" color="red">
                <Card bordered={false} className="criclebox h-full" style={{ flex: 1 }}>
                  <Title level={5}>Biểu đồ thống kê tình hình xếp loại theo thời gian của đơn vị</Title>
                  {<Column {...configTwo} />}
                </Card>
              </Badge.Ribbon>
            </Spin>
          </Col>
        </Row>
      </div>
    </>
  );
};

export default Dashboard;
