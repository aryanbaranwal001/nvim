return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- M: to enable <C-j> in terminal which allows to run multiline commands in nvim terminal
      opts.terminal = {
        win = {
          keys = {
            -- Set the navigation keys to false to disable them inside the terminal
            nav_h = false,
            nav_j = false,
            nav_k = false,
            nav_l = false,
          },
        },
      }

      -- M: s command in dashboard restores the last opened project
      for _, key in ipairs(opts.dashboard.preset.keys) do
        if key.key == "s" then
          -- 1. Unset the default internal session handler
          key.section = nil
          -- 2. Clean command without the <cr> syntax error
          key.action = ":lua require('persistence').load({ last = true })"
          break
        end
      end
    end,
  },
}