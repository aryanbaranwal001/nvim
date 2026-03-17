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
