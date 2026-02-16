return {
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        show_tab_indicators = true,
        offsets = {
          {
            filetype = "snacks_layout_box",
            text = "", -- REMOVE THE TEXT HERE
            text_align = "left",
            separator = true, -- Keep this if you want a vertical line separator
          },
        },
      },
    },
  },
}
