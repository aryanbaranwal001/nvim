-- M: Force Snacks Explorer width and ensure real-time watching
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                wo = {
                  relativenumber = true,
                  number = true,
                },
              },
            },
          },
        },
      },
    },

    -- M: sets the default widht of the leader e file exploere
    keys = {
      {
        "<leader>e",
        function()
          require("snacks").explorer({ layout = { layout = { width = 28 } } })
        end,
        desc = "File Explorer",
      },
    },
  },
}
