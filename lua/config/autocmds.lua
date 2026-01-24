-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- M: removing diagnostic and spell check from markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mdx" },
  callback = function(args)
    -- Disable spelling
    vim.opt_local.spell = false
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
