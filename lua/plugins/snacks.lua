-- M: to enable <C-j> in terminal which allows to run multiline commands in nvim terminal
return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          keys = {
            -- Set the navigation keys to false to disable them inside the terminal
            nav_h = false,
            nav_j = false,
            nav_k = false,
            nav_l = false,
          },
        },
      },
    },
  },
}
