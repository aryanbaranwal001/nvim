-- M: updates the buffer in neovim in real-time (file watcher)
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        -- This forces the explorer to watch for file changes in real-time
        use_libuv_file_watcher = true,
      },
    },
  },
}
