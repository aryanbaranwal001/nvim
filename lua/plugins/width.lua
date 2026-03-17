-- Force Snacks Explorer width + relative numbers only next to actual files
-- The Snacks list buffer is padded to full window height with empty lines,
-- so we check getline() to only show numbers on lines with real content.
_G.snacks_explorer_statuscol = function()
  local lnum = vim.v.lnum
  local content = vim.fn.getline(lnum)
  if content == nil or content == "" then
    return " "
  end
  local relnum = vim.v.relnum
  return (relnum == 0 and tostring(lnum) or tostring(relnum)) .. " "
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                minimal = false,
                wo = {
                  number = true,
                  relativenumber = true,
                  signcolumn = "no",
                  numberwidth = 1,
                  fillchars = "eob: ",
                  statuscolumn = "%!v:lua.snacks_explorer_statuscol()",
                },
              },
            },
          },
        },
      },
    },

    -- M: sets the default widht of the leader e file exploere
    keys = {
      {
        "<leader>e",
        function()
          require("snacks").explorer({ layout = { layout = { width = 28 } } })
        end,
        desc = "File Explorer",
      },
    },
  },
}
