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

-- comments
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

-- vim.keymap.set("n", "<leader>t", "<cmd>lua _NODE_TOGGLE()<cr>", { noremap = true, silent = true, desc = "Node" })
