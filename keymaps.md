# Custom Neovim Keymaps

This file lists the custom keymaps in this LazyVim config. `<leader>` is `Space` unless changed elsewhere.

## General

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `;` | Normal | Enter command mode, same as `:` | `lua/config/keymaps.lua` |
| `<C-g>` | Normal | Show full current file path in a floating window | `lua/config/keymaps.lua` |
| `m` | Normal, Visual | Prime the black-hole register for delete/change operations | `lua/config/keymaps.lua` |
| `u` | Normal, Visual, Operator-pending | Disabled to avoid accidental undo | `lua/config/keymaps.lua` |
| `<C-u>` | Normal | Undo | `lua/config/keymaps.lua` |
| `<C-r>` | Normal | Redo | `lua/config/keymaps.lua` |
| `<C-k>` | Normal, Visual | Scroll up half page | `lua/config/keymaps.lua` |
| `<C-j>` | Normal, Visual | Scroll down half page | `lua/config/keymaps.lua` |

## Buffers

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<leader>h` | Normal | Delete current buffer with Snacks bufdelete | `lua/config/keymaps.lua` |

## Windows

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<leader>w-` | Normal | Maximize current window height | `lua/config/keymaps.lua` |
| `<leader>w\` | Normal | Maximize current window width | `lua/config/keymaps.lua` |
| `<C-S-j>` | Normal | Move to lower split/window | `lua/config/keymaps.lua` |
| `<C-S-k>` | Normal | Move to upper split/window | `lua/config/keymaps.lua` |

## Tabs

These are real Neovim tab pages, not bufferline buffers.

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<A-]>` | Normal | Go to next tab, same as `gt` | `lua/config/keymaps.lua` |
| `<A-[>` | Normal | Go to previous tab, same as `gT` | `lua/config/keymaps.lua` |
| `<leader>tn` | Normal | Open a new tab | `lua/config/keymaps.lua` |
| `<leader>tx` | Normal | Close current tab | `lua/config/keymaps.lua` |

## Terminals

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<leader>kd` | Normal | Open `lazydocker` in a terminal | `lua/config/keymaps.lua` |
| `<C-]>` | Normal, Terminal | Cycle to next Snacks terminal | `lua/config/keymaps.lua` |
| `<C-[>` | Normal, Terminal | Cycle to previous Snacks terminal | `lua/config/keymaps.lua` |
| `<C-/>` | Normal, terminal buffers | Close current terminal window, or use count for numbered Snacks terminal | `lua/config/keymaps.lua` |
| `<C-_>` | Normal, terminal buffers | Same as `<C-/>` | `lua/config/keymaps.lua` |
| `<C-/>` | Terminal, terminal buffers | Close current terminal window | `lua/config/keymaps.lua` |
| `<C-_>` | Terminal, terminal buffers | Same as `<C-/>` | `lua/config/keymaps.lua` |
| `<A-Esc>` | Terminal | Enter terminal normal mode | `lua/config/keymaps.lua` |

## File Explorer

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<leader>e` | Normal | Open Snacks file explorer with width set to 30 | `lua/plugins/width.lua` |

## Git

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<leader>gl` | Normal | Draw GitGraph for all commits, up to 5000 commits | `lua/plugins/gitgraph.lua` |
| `q` | Normal, GitGraph buffer | Close GitGraph buffer | `lua/plugins/gitgraph.lua` |
| `q` | Diffview views | Close Diffview | `lua/plugins/gitgraph.lua` |

## Rust

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `<leader>j` | Normal, Rust buffers | Insert `// %% ` cell marker below the current line and enter insert mode | `lua/config/autocmds.lua` |

## Dashboard

| Key | Mode | Action | Source |
| --- | --- | --- | --- |
| `s` | Dashboard | Restore the last Persistence session | `lua/plugins/snacks.lua` |

## Disabled Plugin Terminal Navigation

These Snacks terminal window navigation keys are explicitly disabled in the plugin config:

| Key name | Action disabled | Source |
| --- | --- | --- |
| `nav_h` | Terminal window navigation left | `lua/plugins/snacks.lua` |
| `nav_j` | Terminal window navigation down | `lua/plugins/snacks.lua` |
| `nav_k` | Terminal window navigation up | `lua/plugins/snacks.lua` |
| `nav_l` | Terminal window navigation right | `lua/plugins/snacks.lua` |
