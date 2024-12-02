export const getGradingName = (score) => {
  if (score >= 90) return { name: "HTXSNV", color: "green" };
  if (score >= 70) return { name: "HTTNV", color: "blue" };
  if (score >= 60) return { name: "HTNV", color: "yellow" };
  return { name: "KHTNV", color: "red" };
};
