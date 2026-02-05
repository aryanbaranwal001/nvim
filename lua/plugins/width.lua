-- M: Force Snacks Explorer width and ensure real-time watching
return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        -- This handles the default configuration
        layout = { layout = { width = 28 } },
      },
    },
    keys = {
      -- This fixes the 'undefined global' by requiring snacks only when pressed
      {
        "<leader>e",
        function()
          require("snacks").explorer({ layout = { layout = { width = 28 } } })
        end,
        desc = "File Explorer",
      },
      {
        "<leader>fe",
        function()
          require("snacks").explorer({ layout = { layout = { width = 28 } } })
        end,
        desc = "File Explorer",
      },
    },
  },
}
