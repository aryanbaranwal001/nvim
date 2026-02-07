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

-- M: Ctrl + g file popup to make file paths visible properly
vim.keymap.set("n", "<C-g>", function()
  local path = vim.fn.expand("%:p")
  require("snacks").win({
    text = path,
    style = "minimal", -- Removes line numbers and sign columns automatically
    position = "float",
    border = "rounded", -- Matches LazyVim's standard rounded look
    title = " File Path ", -- Adds a nice icon and spacing
    title_pos = "center", -- Centers the title for a premium feel
    width = 0.5, -- Uses 50% of screen width (cleaner than full width)
    height = 2, -- Fixed height to accommodate 3-4 lines of wrapped text
    backdrop = 60, -- Dims the background slightly (60% opacity) to focus
    wo = {
      wrap = true, -- Forces wrapping
      linebreak = true, -- Wraps at '/' or separators, not mid-word
      breakindent = true, -- Indents wrapped lines visually
    },
    keys = { q = "close", ["<Esc>"] = "close" },
  })
end, { desc = "Show Full File Path" })
