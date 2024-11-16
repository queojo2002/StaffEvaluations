import { calculateTotalAssessmentValueDynamic } from "./calculateTotalAssessmentValueDynamic";

export const getTotalAssessmentValueSupervisorDynamic = (data, index) => {
  let total = 0;
  data.forEach((item) => {
    if (item.children && item.children.length > 0) {
      total += calculateTotalAssessmentValueDynamic(item.children, index);
    } else {
      total += item.supervisorList[index]?.assessmentValueSupervisor || item.startValue || 0;
    }
  });
  return total;
};
