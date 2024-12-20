import { useEffect, useState } from "react";
import { Tabs } from "antd";

import AddSupervisorToEvaluation from "./SettingEvaluationCompoments/AddSupervisorToEvaluation";
import AddUserToEvaluation from "./SettingEvaluationCompoments/AddUserToEvaluation";

import DetailsAndSortingEvaluationsCriteria from "~/pages/Evaluation/SettingEvaluationCompoments/DetailsAndSortingEvaluationsCriteria";

const SettingEvaluation = (props) => {
  const { refetchApi, closeModal, id } = props;
  const [activeKey, setActiveKey] = useState("1");

  const items = [
    {
      key: "1",
      label: `Danh sách tiêu chí`,
      children: <DetailsAndSortingEvaluationsCriteria id={id} />
    },
    {
      key: "2",
      label: `Cấu hình người dùng`,
      children: <AddUserToEvaluation id={id} />
    },
    {
      key: "3",
      label: `Cấu hình giám sát viên`,
      children: <AddSupervisorToEvaluation id={id} />
    }
  ];

  useEffect(() => {
    setActiveKey("1");
  }, [id]);

  return (
    <>
      <Tabs activeKey={activeKey} onChange={setActiveKey} items={items} />
    </>
  );
};

export default SettingEvaluation;
