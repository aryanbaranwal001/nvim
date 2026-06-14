-- ┌──────────────────────────────────────────────────────────────┐
-- │ Java formatter toggle                                          │
-- │   true  -> format with Google Java Format (2-space, opinionated)│
-- │   false -> use the default jdtls LSP formatter                  │
-- └──────────────────────────────────────────────────────────────┘
local use_google_format = true

-- When the toggle is off, contribute nothing: jdtls keeps its own formatter.
if not use_google_format then
  return {}
end

-- Match Google Java Format's 2-space style for the editor's own indentation,
-- so manual edits line up with what the formatter produces.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

return {
  -- Install google-java-format binary via Mason (wrapper adds JDK --add-exports flags)
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "google-java-format" } },
  },
  -- Use Google Java Format instead of jdtls's built-in formatter.
  -- conform takes priority over the LSP formatter, so jdtls formatting is bypassed.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },
}
