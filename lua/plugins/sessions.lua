return {
  -- M: s command in dashboard restores the last opened project
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
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
