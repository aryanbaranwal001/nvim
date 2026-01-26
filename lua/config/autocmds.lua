-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- M: removing diagnostic and spell check from markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mdx" },
  callback = function(args)
    -- Disable diagnostics for the current buffer
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- M: Autosave Config
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

-- M: Force spellcheck off for every buffer that opens
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- M: Reload files changed outside Neovim and change the buffer (lazygit discard, etc.)
vim.opt.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    vim.cmd("checktime")
  end,
})

vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*lazygit*",
  callback = function()
    vim.cmd("checktime")
  end,
})
