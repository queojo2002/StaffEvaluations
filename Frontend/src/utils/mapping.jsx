import Units from "../pages/Units/index";
import User from "../pages/Users/_id";

import {
  IconBarChartFill,
  IconBxMedal,
  IconCardChecklist,
  IconClipboardTextClock,
  IconComment,
  IconDashboard,
  IconDeploymentUnit,
  IconDocument_justified,
  IconPersonRolodex,
  IconScoreboardOutline,
  IconThumbsUpDown,
  IconUser,
  IconUserShield
} from "./svg";

export const iconMapping = {
  IconBarChartFill: IconBarChartFill,
  IconBxMedal: IconBxMedal,
  IconCardChecklist: IconCardChecklist,
  IconClipboardTextClock: IconClipboardTextClock,
  IconComment: IconComment,
  IconDashboard: IconDashboard,
  IconDeploymentUnit: IconDeploymentUnit,
  IconDocument_justified: IconDocument_justified,
  IconPersonRolodex: IconPersonRolodex,
  IconScoreboardOutline: IconScoreboardOutline,
  IconThumbsUpDown: IconThumbsUpDown,
  IconUser: IconUser,
  IconUserShield: IconUserShield
};

export const componentsMapping = {
  dashboard: <User />,
  evaluations: <User />,
  users: <User />,
  units: <Units />,
  positions: <User />,
  "evaluation-ratings": <User />,
  "evaluation-criteria": <User />,
  "evaluation-grading": <User />,
  "evaluation-pros-cons": <User />,
  "evaluation-comments": <User />,
  "evaluation-periods": <User />,
  "evaluation-statistics": <User />,
  roles: <User />
};
