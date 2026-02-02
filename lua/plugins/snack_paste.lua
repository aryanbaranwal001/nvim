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
