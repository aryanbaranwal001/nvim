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
        -- IMPACT: When you hit Enter on a commit, you now get a choice
        on_select_commit = function(commit)
          vim.ui.select({ "Diffview Open", "Checkout Commit" }, {
            prompt = "Select Action:",
            format_item = function(item)
              return "➜ " .. item
            end,
          }, function(choice)
            if not choice then
              return
            end

            if choice == "Diffview Open" then
              vim.notify("DiffviewOpen " .. commit.hash .. "^!")
              vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
            elseif choice == "Checkout Commit" then
              -- Perform the checkout
              vim.cmd(":!git checkout " .. commit.hash)
              -- Optional: Notify the user
              vim.notify("Checked out " .. commit.hash, vim.log.levels.INFO)
              -- Optional: Redraw the graph to show updated HEAD
              require("gitgraph").draw({}, { all = true, max_count = 5000 })
            end
          end)
        end,
        on_select_range_commit = function(from, to)
          vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    },
    config = function(_, opts)
      require("gitgraph").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "gitgraph",
        callback = function()
          vim.opt_local.buflisted = false
          vim.opt_local.buftype = "nofile"
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
