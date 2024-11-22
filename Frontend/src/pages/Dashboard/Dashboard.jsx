import { useEffect, useState } from "react";
import { BookOutlined, DeploymentUnitOutlined, NotificationOutlined, UserOutlined } from "@ant-design/icons";
import { Badge, Card, Col, Row, Skeleton, Spin, Typography } from "antd";

import { getAnalyst } from "~/apis";

const Dashboard = () => {
  const { Title } = Typography;
  const [loading, setLoading] = useState(false);
  const [datas, setDatas] = useState([]);

  const fetchApiGetAll = async () => {
    setLoading(true);
    const data1 = await getAnalyst();
    setDatas(data1);
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

        <Row gutter={[24, 0]}>
          <Col xs={24} sm={24} md={24} lg={24} xl={24} className="mb-24">
            <Spin size="large" spinning={false}>
              <Badge.Ribbon text="Mới" color="red">
                <Card bordered={false} className="criclebox h-full">
                  <Title level={5}>
                    {" "}
                    Biểu đồ thống kê số lượng người dùng đã tham gia đánh giá theo từng phiếu đánh giá
                  </Title>
                  {/* <ColumnChart data={dataChartsCompeted} /> */}
                </Card>
              </Badge.Ribbon>
            </Spin>
          </Col>
        </Row>

        <Row gutter={[24, 0]}>
          <Col xs={24} sm={24} md={24} lg={24} xl={24} className="mb-24">
            <Spin size="large" spinning={false}>
              <Badge.Ribbon text="Mới" color="red">
                <Card bordered={false} className="criclebox h-full">
                  <Title level={5}>
                    {" "}
                    Biểu đồ thống kê số lượng người dùng chưa/không tham gia đánh giá theo từng phiếu đánh giá
                  </Title>
                  {/* <ColumnChart data={dataChartsPending} /> */}
                </Card>
              </Badge.Ribbon>
            </Spin>
          </Col>
        </Row>

        <Row gutter={[24, 0]}>
          <Col xs={24} md={24} sm={24} lg={24} xl={24}>
            {/* <CompanyIntroduction /> */}
          </Col>
        </Row>
      </div>
    </>
  );
};

export default Dashboard;
