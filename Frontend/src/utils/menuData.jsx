import { NavLink } from "react-router-dom";

import Users from "../pages/Users/index";

const DATA_MENU = [
  {
    key: "dashboard",
    name: "Trang tổng quan",
    label: (
      <NavLink to="/dashboard">
        <span className="icon" style={{}}>
          {}
        </span>
        <span className="menu-items">Trang tổng quan</span>
      </NavLink>
    )
  },
  {
    key: "evaluations",
    name: "Quản lý phiếu đánh giá",
    label: (
      <NavLink to="/evaluations">
        <span className="icon" style={{}}>
          {}
        </span>
        <span className="menu-items">Quản lý phiếu đánh giá</span>
      </NavLink>
    )
  },
  {
    key: "evaluations-supervisor",
    name: "Quản lý cấp phê duyệt",
    label: (
      <NavLink to="/evaluations-supervisor">
        <span className="icon" style={{}}>
          {}
        </span>
        <span className="menu-items">Quản lý cấp phê duyệt</span>
      </NavLink>
    )
  },
  {
    key: "organization-management",
    name: "Quản lý đơn vị và nhân sự",
    label: (
      <div className="menu-item-label">
        <span className="label">Quản lý đơn vị và nhân sự</span>
      </div>
    ),
    children: [
      {
        key: "users",
        name: "Quản lý người dùng",
        components: <Users />,
        label: (
          <NavLink to="/organization-management/users">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Quản lý người dùng</span>
          </NavLink>
        )
      },
      {
        key: "units",
        name: "Quản lý đơn vị/phòng ban",
        label: (
          <NavLink to="/organization-management/units">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Quản lý đơn vị/phòng ban</span>
          </NavLink>
        )
      },
      {
        key: "positions",
        name: "Quản lý chức vụ/chức danh",
        label: (
          <NavLink to="/organization-management/positions">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Quản lý chức vụ/chức danh</span>
          </NavLink>
        )
      }
    ]
  },
  {
    key: "categories",
    name: "Quản lý danh mục",
    label: (
      <div className="menu-item-label">
        <span className="label">Quản lý danh mục</span>
      </div>
    ),
    children: [
      {
        key: "evaluation-ratings",
        name: "Danh mục thang điểm đánh giá",
        label: (
          <NavLink to="/categories/evaluation-ratings">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Danh mục thang điểm đánh giá</span>
          </NavLink>
        )
      },
      {
        key: "evaluation-criteria",
        name: "Danh mục tiêu chí đánh giá",
        label: (
          <NavLink to="/categories/evaluation-criteria">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Danh mục tiêu chí đánh giá</span>
          </NavLink>
        )
      },
      {
        key: "evaluation-grading",
        name: "Danh mục xếp loại đánh giá",
        label: (
          <NavLink to="/categories/evaluation-grading">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Danh mục xếp loại đánh giá</span>
          </NavLink>
        )
      },
      {
        key: "evaluation-pros-cons",
        name: "Danh mục ưu và nhược điểm đánh giá",
        label: (
          <NavLink to="/categories/evaluation-pros-cons">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Danh mục ưu và nhược điểm đánh giá</span>
          </NavLink>
        )
      },
      {
        key: "evaluation-comments",
        name: "Danh mục nhận xét đánh giá",
        label: (
          <NavLink to="/categories/evaluation-comments">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Danh mục nhận xét đánh giá</span>
          </NavLink>
        )
      },
      {
        key: "evaluation-periods",
        name: "Danh mục kỳ đánh giá",
        label: (
          <NavLink to="/categories/evaluation-periods">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="menu-items">Danh mục kỳ đánh giá</span>
          </NavLink>
        )
      }
    ]
  },
  {
    key: "statistics",
    name: "Thống kê",
    label: (
      <span className="menu-item-label">
        <span className="menu-items">Thống kê</span>
      </span>
    ),
    children: [
      {
        key: "evaluation-statistics",
        name: "Thống kê đánh giá",
        label: (
          <NavLink to="/statistics/evaluation-statistics">
            <span className="icon" style={{}}>
              {}
            </span>
            <span className="label truncate-label">Thống kê đánh giá</span>
          </NavLink>
        )
      }
    ]
  }
];

export default DATA_MENU;
