return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- THIS IS THE FIX: Target the picker source specifically
      opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
        sources = {
          explorer = {
            ignored = true, -- Show git-ignored files by default
            hidden = false, -- Keep dotfiles hidden
          },
        },
      })

      -- Your existing terminal config
      opts.terminal = {
        win = {
          keys = {
            nav_h = false,
            nav_j = false,
            nav_k = false,
            nav_l = false,
          },
        },
      }

      -- Your existing dashboard config
      for _, key in ipairs(opts.dashboard.preset.keys) do
        if key.key == "s" then
          key.section = nil
          key.action = ":lua require('persistence').load({ last = true })"
          break
        end
      end
    end,
  },
}
