return {
  -- 1. Catppuccin (Mocha is the dark 'flavour')
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- Set to false if you don't want transparency
    },
  },

  -- 2. Kanagawa (Dragon is the darker, heavier version)
  { "rebelot/kanagawa.nvim", priority = 1000 },

  -- 3. Rose-Pine (Very clean and trendy)
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },

  -- 4. Nightfox (Carbonfox is a great "true black" OLED theme)
  { "EdenEast/nightfox.nvim", priority = 1000 },

  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Options are optional; these are the defaults for Dark+
      style = "dark", -- or 'light'
      transparent_background = false,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = true,
    },
    config = function(_, opts)
      require("vscode").setup(opts)
      require("vscode").load()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
