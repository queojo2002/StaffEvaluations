import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  menuInfo: null
};

const menuSlice = createSlice({
  name: "menu",
  initialState,
  reducers: {
    setMenuInfo(state, action) {
      state.menuInfo = action.payload;
    }
  }
});

export const { setMenuInfo } = menuSlice.actions;
export default menuSlice.reducer;
