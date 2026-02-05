-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- M: in normal mode ; will funtion as :
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

-- M: open lazydocker keymap
vim.keymap.set("n", "<leader>kd", ":term lazydocker<CR>i", { desc = "LazyDocker" })

-- M: map leader bd to leader h
vim.keymap.set("n", "<leader>h", function()
  require("snacks").bufdelete()
end, { desc = "Delete Buffer" })
