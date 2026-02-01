-- M: disable inlay_hints as default without removing gd gi functionalities
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = { enabled = false }
    end,
  },
}
