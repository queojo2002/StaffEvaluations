import { useEffect, useState } from "react";
import { Tabs } from "antd";

import EvaluationCAT from "./EvaluationConsolidationAndTransferConfirmComponents/EvaluationCAT";
import EvaluationCATListFileExample from "./EvaluationConsolidationAndTransferConfirmComponents/EvaluationCATListFileExample";

const EvaluationConsolidationAndTransferConfirm = (props) => {
  const { refetchApi, closeModal, id } = props;
  const [activeKey, setActiveKey] = useState("1");

  const items = [
    {
      key: "1",
      label: `Tổng hợp và chuyển`,
      children: <EvaluationCAT id={id} refetchApi={refetchApi} setIsOpenModalConsolidationAndTransfer={closeModal} />
    },
    {
      key: "2",
      label: `Word báo cáo`,
      children: <EvaluationCATListFileExample id={id} />
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

export default EvaluationConsolidationAndTransferConfirm;
