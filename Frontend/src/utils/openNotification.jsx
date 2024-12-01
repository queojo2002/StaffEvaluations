import { notification } from "antd";

export const openNotificationTopLeft = (type, message, description) => {
  notification[type]({
    message: message || "Thông báo",
    description: <span dangerouslySetInnerHTML={{ __html: description || "Đây là nội dung của thông báo" }} />,
    duration: 2
  });
};

export const openNotificationBottomRight = (type, message, description) => {
  notification[type]({
    message: message || "Thông báo",
    description: description || "Đây là nội dung của thông báo",
    duration: 2,
    placement: "bottomRight"
  });
};
