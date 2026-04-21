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

-- M: remap following keymaps for faster access in windows mode
local map = vim.keymap.set
map("n", "<leader>w-", "<C-w>_", { desc = "Maximize Height" })
map("n", "<leader>w\\", "<C-w>|", { desc = "Maximize Width" })

-- M: configs for delete without yank
-- Pressing 'm' (for "mute" or "minus") primes the black hole register
vim.keymap.set({ "n", "v" }, "m", [["_]], { desc = "Prime Black Hole Register" })

-- M: maps following so that unintended u (undo) doesn't happen
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-u>", { desc = "Scroll up half page" })
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-d>", { desc = "Scroll down half page" })

-- M: Ctrl+Shift+j/k to navigate windows up/down (requires kitty keyboard protocol)
vim.keymap.set("n", "<C-S-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-S-k>", "<C-w>k", { desc = "Go to upper window" })

-- M: Ctrl+u = Undo
vim.keymap.set("n", "<C-u>", "u", { desc = "Undo" })
vim.keymap.set("n", "<C-r>", "<C-r>", { desc = "Redo" })

-- M: Disables 'u' in Normal, Visual, Select, and Operator-pending modes
vim.keymap.set({ "n", "v", "o" }, "u", "<nop>", { noremap = true, silent = true })

-- M: Cycling logic for terminals
local function get_snacks_terms()
  local snacks = require("snacks")
  local terms = snacks.terminal.list()

  if #terms == 0 then
    snacks.terminal.toggle()
    return nil, nil
  end

  local current_idx = nil
  for i, term in ipairs(terms) do
    if term.win and vim.api.nvim_win_is_valid(term.win) then
      current_idx = i
      break
    end
  end
  return terms, current_idx
end

local function cycle_next()
  local terms, current_idx = get_snacks_terms()
  if not terms or #terms == 0 then
    return
  end

  if current_idx then
    terms[current_idx]:hide()
    local next_idx = (current_idx % #terms) + 1
    terms[next_idx]:show()
  else
    terms[1]:show()
  end
end

local function cycle_prev()
  local terms, current_idx = get_snacks_terms()
  if not terms or #terms == 0 then
    return
  end

  if current_idx then
    terms[current_idx]:hide()
    -- Wrap-around logic for "previous"
    local prev_idx = (current_idx - 2 + #terms) % #terms + 1
    terms[prev_idx]:show()
  else
    terms[#terms]:show()
  end
end

-- Keymaps
vim.keymap.set({ "n", "t" }, "<C-]>", cycle_next, { desc = "Next Terminal" })
vim.keymap.set({ "n", "t" }, "<C-[>", cycle_prev, { desc = "Prev Terminal" })

-- M: make ctrl / to strictly close the current terminal window
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("terminal_smart_close", { clear = true }),
  callback = function(args)
    local function smart_toggle()
      if vim.v.count > 0 then
        -- Let Snacks handle the numbered terminal natively using the count
        require("snacks").terminal()
      else
        -- Cleanly close the current terminal window
        vim.cmd("close")
      end
    end

    -- Normal mode bindings
    vim.keymap.set("n", "<C-/>", smart_toggle, { buffer = args.buf, silent = true })
    vim.keymap.set("n", "<C-_>", smart_toggle, { buffer = args.buf, silent = true })

    -- Terminal mode bindings
    vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { buffer = args.buf, silent = true })
    vim.keymap.set("t", "<C-_>", "<cmd>close<cr>", { buffer = args.buf, silent = true })
  end,
})

-- M: remap esc esc to ctrl space for faster normal mode entry
vim.keymap.set("t", "<A-Esc>", "<C-\\><C-n>", { desc = "Terminal Normal Mode" })

-- M: to toggle between tabs more effectively
vim.keymap.set("n", "<A-]>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<A-[>", "gT", { desc = "Prev tab" })

-- M: for opening and closing tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
