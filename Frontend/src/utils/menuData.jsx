import { CiViewList } from "react-icons/ci";
import { GoChecklist } from "react-icons/go";
import { GrScorecard } from "react-icons/gr";
import { HiUsers } from "react-icons/hi";
import { MdAssessment, MdCategory, MdComment, MdDashboard, MdEvent, MdOutlineGrading } from "react-icons/md";
import { MdApproval } from "react-icons/md";
import { MdBarChart } from "react-icons/md";
import { MdPieChart } from "react-icons/md";
import { PiSubtitlesBold } from "react-icons/pi";
import { VscOrganization } from "react-icons/vsc";
import { Link } from "react-router-dom";
import { DeploymentUnitOutlined } from "@ant-design/icons";

import Units from "../pages/Units";
import Users from "../pages/Users";

const ICON_SIZE = 18;

const DATA_MENU = [
  {
    key: "dashboard",
    key: "Trang tổng quan",
    label: (
      <Link className="menu-items" to={"/dashboard"}>
        Trang tổng quan
      </Link>
    ),
    icon: <MdDashboard size={ICON_SIZE} />
  },
  {
    key: "statistics",
    name: "Thống kê",
    label: "Thống kê",
    icon: <MdBarChart size={ICON_SIZE} />,
    children: [
      {
        key: "evaluation-statistics",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/statistics/evaluation-statistics"}>
            Thống kê đánh giá
          </Link>
        ),
        icon: <MdPieChart size={ICON_SIZE} />
      }
    ]
  },
  {
    key: "organization-management",
    name: "Quản lý đơn vị và nhân sự",
    label: "Quản lý đơn vị và nhân sự",
    icon: <VscOrganization size={ICON_SIZE} />,
    children: [
      {
        key: "users",
        name: "Quản lý người dùng",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/organization-management/users"}>
            Quản lý người dùng
          </Link>
        ),
        icon: <HiUsers size={ICON_SIZE} />
      },
      {
        key: "units",
        name: "Quản lý đơn vị/phòng ban",
        components: <Units />,
        label: (
          <Link className="menu-items" to={"/organization-management/units"}>
            Quản lý đơn vị/phòng ban
          </Link>
        ),
        icon: <DeploymentUnitOutlined size={ICON_SIZE} />
      },
      {
        key: "positions",
        name: "Quản lý chức vụ/chức danh",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/organization-management/positions"}>
            Quản lý chức vụ/chức danh
          </Link>
        ),
        icon: <PiSubtitlesBold size={ICON_SIZE} />
      }
    ]
  },
  {
    key: "categories",
    name: "Quản lý danh mục",
    label: "Quản lý danh mục",
    icon: <MdCategory size={ICON_SIZE} />,
    children: [
      {
        key: "evaluation-ratings",
        name: "Danh mục thang điểm đánh giá",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/categories/evaluation-ratings"}>
            Danh mục thang điểm đánh giá
          </Link>
        ),
        icon: <GrScorecard size={ICON_SIZE} />
      },
      {
        key: "evaluation-criteria",
        name: "Danh mục tiêu chí đánh giá",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/categories/evaluation-criteria"}>
            Danh mục tiêu chí đánh giá
          </Link>
        ),
        icon: <CiViewList size={ICON_SIZE} />
      },
      {
        key: "evaluation-grading",
        name: "Danh mục xếp loại đánh giá",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/categories/evaluation-grading"}>
            Danh mục xếp loại đánh giá
          </Link>
        ),
        icon: <MdOutlineGrading size={ICON_SIZE} />
      },
      {
        key: "evaluation-pros-cons",
        name: "Danh mục ưu và nhược điểm đánh giá",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/categories/evaluation-pros-cons"}>
            Danh mục ưu và nhược điểm đánh giá
          </Link>
        ),
        icon: <MdAssessment size={ICON_SIZE} />
      },
      {
        key: "evaluation-comments",
        name: "Danh mục nhận xét đánh giá",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/categories/evaluation-comments"}>
            Danh mục nhận xét đánh giá
          </Link>
        ),
        icon: <MdComment size={ICON_SIZE} />
      },
      {
        key: "evaluation-periods",
        name: "Danh mục kỳ đánh giá",
        components: <Users />,
        label: (
          <Link className="menu-items" to={"/categories/evaluation-periods"}>
            Danh mục kỳ đánh giá
          </Link>
        ),
        icon: <MdEvent size={ICON_SIZE} />
      }
    ]
  },
  {
    key: "evaluations",
    name: "Quản lý phiếu đánh giá",
    components: <Users />,
    label: (
      <Link className="menu-items" to={"/evaluations"}>
        Quản lý phiếu đánh giá
      </Link>
    ),
    icon: <GoChecklist size={ICON_SIZE} />
  },
  {
    key: "evaluations-supervisor",
    name: "Quản lý cấp phê duyệt",
    components: <Users />,
    label: (
      <Link className="menu-items" to={"/evaluations-supervisor"}>
        Quản lý cấp phê duyệt
      </Link>
    ),
    icon: <MdApproval size={ICON_SIZE} />
  }
];

export default DATA_MENU;
