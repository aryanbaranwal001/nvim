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
        -- 1. CLEANER TIMESTAMP: "09-Feb 18:08" (Removed Year)
        timestamp = "%d %b | %H:%M ",
        -- 2. BETTER ORDER: Hash -> Time -> Branch -> Author
        -- Moving 'author' to the end prevents long names from pushing the branch labels away
        fields = { "hash", "timestamp", "branch_name", "tag", "author" },
      },
      hooks = {
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
              vim.cmd(":!git checkout " .. commit.hash)
              vim.notify("Checked out " .. commit.hash, vim.log.levels.INFO)
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

      -- Custom Colors (Vibrant Green Msg, Muted Hash)
      local colors = {
        hash = "#9aa5ce", -- Duller Blue-Grey
        time = "#4EC9B0", -- Bright Teal
        author = "#545c7e", -- Dark Muted Grey
        branch = "#ff9e64", -- Orange
        msg = "#a6e3a1", -- Vibrant Green
      }

      vim.api.nvim_set_hl(0, "GitGraphHash", { fg = colors.hash })
      vim.api.nvim_set_hl(0, "GitGraphTimestamp", { fg = colors.time })
      vim.api.nvim_set_hl(0, "GitGraphAuthor", { fg = colors.author, italic = true })
      vim.api.nvim_set_hl(0, "GitGraphBranchName", { fg = colors.branch, bold = true })
      vim.api.nvim_set_hl(0, "GitGraphMsg", { fg = colors.msg })

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
