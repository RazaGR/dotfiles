-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- copilot
vim.cmd([[imap <silent> <C-j> <Plug>(copilot-next)]])
vim.cmd([[imap <silent> <C-l> <Plug>(copilot-previous)]])

-- comments settings
vim.keymap.set(
  "n",
  "<leader>/",
  "<cmd>lua require('Comment.api').toggle.linewise()<CR>",
  { noremap = true, silent = true, desc = "Toggle Comment" }
)
vim.keymap.set(
  "v",
  "<leader>/",
  '<ESC><CMD>lua require("Comment.api").toggle.linewise_op(vim.fn.visualmode())<CR>',
  { noremap = true, silent = true, desc = "Toggle Comment" }
)

vim.keymap.set("n", "<leader>r", "<Plug>RestNvim<cr>", { silent = true, desc = "REST" })
-- vim.keymap.set("n", "<leader>t", "<cmd>lua _NODE_TOGGLE()<cr>", { noremap = true, silent = true, desc = "Node" })

-- git signs
vim.keymap.set(
  "n",
  "<leader>gS",
  "<cmd>:Gitsigns toggle_current_line_blame<CR>",
  { noremap = true, silent = true, desc = "Toggle Gitsign" }
)

-- format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

-- flutter tools status line
-- function _G.statusLine()
--  return vim.g.flutter_tools_decorations.app_version
--end
-- vim.opt.statusline = "%!v:statusLine()"
-- explorer collapse/expand
-- vim.keymap.set("n", "h", "<cmd>toggle_node<CR>", { noremap = true, silent = true, desc = "Neo-tree: Collapse folder" })
