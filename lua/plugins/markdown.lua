return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        -- M: remove header highlighting
        backgrounds = {},
      },
      -- M: This prevents the plugin from forcing conceallevel = 3
      conceal = {
        enabled = false,
      },
      -- M: Stop it from forcing conceallevel back to 3 during window focus/render events
      win_options = {
        conceallevel = { rendered = 0, rendered_off = 0 },
      },
    },
  },
}
