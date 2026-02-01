-- M: remove header highlighting in markdown
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        -- This removes the background colors for headings
        backgrounds = {},
      },
    },
  },
}
