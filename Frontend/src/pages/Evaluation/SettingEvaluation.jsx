import { Tabs } from "antd";

import DetailsAndSortingEvaluationsCriteria from "~/pages/Evaluation/SettingEvaluationCompoments/DetailsAndSortingEvaluationsCriteria";

const SettingEvaluation = (props) => {
  const { refetchApi, closeModal, id } = props;

  const items = [
    {
      key: "1",
      label: `Danh sách tiêu chí`,
      children: <DetailsAndSortingEvaluationsCriteria id={id} />
    },
    {
      key: "2",
      label: `Cấu hình người dùng`,
      children: `Tab 3`
    },
    {
      key: "3",
      label: `Cấu hình giám sát viên`,
      children: `Tab 4`
    }
  ];

  return (
    <>
      <Tabs defaultActiveKey="1" items={items} />
    </>
  );
};

export default SettingEvaluation;
