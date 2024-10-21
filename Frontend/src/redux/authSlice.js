import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  userInfo: null,
  isLoggedIn: !!(localStorage.getItem("access_token") && localStorage.getItem("refresh_token"))
};

const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    login(state, action) {
      state.isLoggedIn = true;
      localStorage.setItem("access_token", action.payload.access_token);
      localStorage.setItem("refresh_token", action.payload.refresh_token);
    },
    logout(state) {
      state.isLoggedIn = false;
      localStorage.removeItem("access_token");
      localStorage.removeItem("refresh_token");
    },
    setUserInfo(state, action) {
      state.userInfo = action.payload;
    }
  }
});

export const { login, logout, setUserInfo } = authSlice.actions;
export default authSlice.reducer;
