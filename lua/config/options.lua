-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- M: enable wrapping ability of h j k l
vim.opt.whichwrap:append("<,>,h,l,[,]")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- M: read the clipboard with a 2 second limit. Without one, xsel can wait
-- forever when the clipboard owner does not answer (seen during a screen
-- lock, when yanky reads the clipboard on FocusLost), and nvim freezes with it.
vim.g.clipboard = {
  name = "xsel-with-timeout",
  copy = {
    ["+"] = { "xsel", "--nodetach", "-i", "-b" },
    ["*"] = { "xsel", "--nodetach", "-i", "-p" },
  },
  paste = {
    ["+"] = { "timeout", "2", "xsel", "-o", "-b" },
    ["*"] = { "timeout", "2", "xsel", "-o", "-p" },
  },
  cache_enabled = 1,
}
