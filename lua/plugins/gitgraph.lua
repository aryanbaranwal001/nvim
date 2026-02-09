return {
  {
    "isakbm/gitgraph.nvim",
    dependencies = {
      {
        "sindrets/diffview.nvim",
        opts = {
          keymaps = {
            view = { ["q"] = "<cmd>DiffviewClose<cr>" },
            file_panel = { ["q"] = "<cmd>DiffviewClose<cr>" },
            file_history = { ["q"] = "<cmd>DiffviewClose<cr>" },
          },
        },
      },
    },
    opts = {
      symbols = {
        merge_commit = "",
        merge_commit_end = "",
        commit = "",
        commit_end = "",
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
    config = function(_, opts)
      require("gitgraph").setup(opts)

      -- Auto-command to configure the gitgraph buffer correctly
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "gitgraph",
        callback = function()
          vim.opt_local.buflisted = false
          vim.opt_local.buftype = "nofile" -- Prevents "Overwrite existing file" popup
          vim.keymap.set("n", "q", "<cmd>bd<cr>", { buffer = true, desc = "Close GitGraph" })
        end,
      })
    end,
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
