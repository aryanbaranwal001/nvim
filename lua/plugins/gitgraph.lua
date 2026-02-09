return {
  {
    "isakbm/gitgraph.nvim",
    dependencies = { "sindrets/diffview.nvim" },
    opts = {
      symbols = {
        -- merge_commit = "",
        -- merge_commit_end = "",
        -- commit = "",
        -- commit_end = "",
        merge_commit = "",
        merge_commit_end = "",
        commit = "",
        commit_end = "", -- You can also change the line shapes if you want:
        -- GVER = "│",
        -- GHOR = "─",
        -- GCLD = "╮",
        -- GCRD = "╭",
        -- GCLU = "╯",
        -- GCRU = "╰",
      },
      format = {
        timestamp = "%d-%b-%Y %H:%M",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.notify("DiffviewOpen " .. commit.hash .. "^!")
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        end,
        on_select_range_commit = function(from, to)
          vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },
}
