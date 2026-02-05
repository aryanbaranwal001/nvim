-- M: leader p (yank list) does yank instead of paste after hitting enter
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          registers = {
            confirm = { "yank", "close" },
          },
          yanky = {
            confirm = { "yank", "close" },
          },
        },
      },
    },
  },
}
