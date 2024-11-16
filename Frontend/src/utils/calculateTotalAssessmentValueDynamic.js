export const calculateTotalAssessmentValueDynamic = (children, index) => {
  let total = 0;
  children.forEach((child) => {
    if (child.children && child.children.length > 0) {
      total += calculateTotalAssessmentValueDynamic(child.children, index);
    } else {
      total += child.supervisorEvaluations[index].assessmentValueSupervisor || 0;
    }
  });
  return total;
};
