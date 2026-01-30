-- M: autosave on focus change and each autosave triggers rustfmt
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "CmdlineEnter" }, {
  desc = "Autosave on focus change",
  pattern = "*",
  nested = true,
  callback = function()
    -- Check if buffer is modified, has a filename, and is a normal file type
    if vim.bo.modified and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.cmd("silent! update")
    end
  end,
})
