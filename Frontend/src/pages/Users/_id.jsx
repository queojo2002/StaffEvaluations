import React, { useEffect } from "react";

const User = (props) => {
  const { id, isOpenModal } = props;

  useEffect(() => {
    console.log("User ID:", id);
  }, [id]);

  return <div>User ID: {id}</div>;
};

export default User;
