return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- M: keeps > raw
      quote = { enabled = false }, -- Keeps > raw

      heading = {
        backgrounds = {}, -- Removes header background colors
        sign = false, -- Keeps ==== raw
      },

      -- M: set the conceallevel=0
      win_options = {
        conceallevel = { rendered = 0, rendered_off = 0 },
      },
    },
  },
}
