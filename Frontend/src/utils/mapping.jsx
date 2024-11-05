import Roles from "../pages/Roles/Roles";
import Units from "../pages/Units/Units";

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

import Evaluation from "~/pages/Evaluation/Evaluation";
import EvaluationsComments from "~/pages/EvaluationComments/EvaluationsComments";
import EvaluationCriteria from "~/pages/EvaluationCriteria/EvaluationCriteria";
import EvaluationPeriods from "~/pages/EvaluationPeriods/EvaluationPeriods";
import EvaluationProsCons from "~/pages/EvaluationProsCons/EvaluationProsCons";
import EvaluationRatings from "~/pages/EvaluationRatings/EvaluationRatings";
import Users from "~/pages/Users/Users";
import UserType from "~/pages/UserType/UserType";

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
  dashboard: <Users />,
  evaluations: <Evaluation />,
  users: <Users />,
  units: <Units />,
  "user-type": <UserType />,
  "evaluation-ratings": <EvaluationRatings />,
  "evaluation-criteria": <EvaluationCriteria />,
  "evaluation-pros-cons": <EvaluationProsCons />,
  "evaluation-comments": <EvaluationsComments />,
  "evaluation-periods": <EvaluationPeriods />,
  "evaluation-statistics": <Users />,
  roles: <Roles />
};
