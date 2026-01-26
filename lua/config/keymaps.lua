-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- M: in normal mode ; will funtion as :
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

-- M: remove the project root given by lsp
vim.g.root_spec = { { ".git", "lua" }, "cwd" }

-- M: open lazydocker keymap
vim.keymap.set("n", "<leader>kd", ":term lazydocker<CR>i", { desc = "LazyDocker" })

-- M: open lazysql keymap
vim.keymap.set("n", "<leader>kp", function()
  require("snacks").terminal("lazysql", {
    win = {
      style = "float",
      width = 0.9,
      height = 0.9,
    },
  })
end, { desc = "Postgres TUI (Lazysql)" })
