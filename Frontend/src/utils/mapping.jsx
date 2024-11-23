import Roles from "../pages/Roles/Roles";
import Units from "../pages/Units/Units";

import {
  IconAccountSupervisorOutline,
  IconBarChartFill,
  IconBxMedal,
  IconBxTransfer,
  IconBxUserCheck,
  IconCardChecklist,
  IconClipboardTextClock,
  IconComment,
  IconDashboard,
  IconDeploymentUnit,
  IconDocument_justified,
  IconFileDocumentMultiple,
  IconPersonRolodex,
  IconScoreboardOutline,
  IconThumbsUpDown,
  IconUser,
  IconUserShield
} from "./svg";

import Dashboard from "~/pages/Dashboard/Dashboard";
import Evaluation from "~/pages/Evaluation/Evaluation";
import EvaluationsComments from "~/pages/EvaluationComments/EvaluationsComments";
import EvaluationCriteria from "~/pages/EvaluationCriteria/EvaluationCriteria";
import SelfEvaluation from "~/pages/EvaluationForms/SelfEvaluation";
import SupervisorEvaluation from "~/pages/EvaluationForms/SupervisorEvaluation";
import EvaluationPeriods from "~/pages/EvaluationPeriods/EvaluationPeriods";
import EvaluationProsCons from "~/pages/EvaluationProsCons/EvaluationProsCons";
import EvaluationRatings from "~/pages/EvaluationRatings/EvaluationRatings";
import EvaluationSample from "~/pages/EvaluationSample/EvaluationSample";
import EvaluationConsolidationAndTransfer from "~/pages/Statistics/EvaluationConsolidationAndTransfer";
import EvaluationStatistics from "~/pages/Statistics/EvaluationStatistics";
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
  IconUserShield: IconUserShield,
  IconBxUserCheck: IconBxUserCheck,
  IconAccountSupervisorOutline: IconAccountSupervisorOutline,
  IconBxTransfer: IconBxTransfer,
  IconFileDocumentMultiple: IconFileDocumentMultiple
};

export const componentsMapping = {
  dashboard: <Dashboard />,
  evaluations: <Evaluation />,
  users: <Users />,
  units: <Units />,
  "user-type": <UserType />,
  "evaluation-ratings": <EvaluationRatings />,
  "evaluation-criteria": <EvaluationCriteria />,
  "evaluation-pros-cons": <EvaluationProsCons />,
  "evaluation-comments": <EvaluationsComments />,
  "evaluation-periods": <EvaluationPeriods />,
  "evaluation-statistics": <EvaluationStatistics />,
  "self-evaluation": <SelfEvaluation />,
  "supervisor-evaluation": <SupervisorEvaluation />,
  roles: <Roles />,
  "consolidation-and-transfer": <EvaluationConsolidationAndTransfer />,
  "evaluations-sample": <EvaluationSample />
};
