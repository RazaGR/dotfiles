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

-- REST client
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim<cr>", { silent = true, desc = "REST call" })
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview<cr>", { silent = true, desc = "REST preview" })
-- git signs
vim.keymap.set(
  "n",
  "<leader>gS",
  "<cmd>:Gitsigns toggle_current_line_blame<CR>",
  { noremap = true, silent = true, desc = "Toggle Gitsign" }
)

-- format on save
-- disable for now
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

-- map shift + p to open last files
vim.keymap.set(
  "n",
  "<S-p>",
  "<cmd>Telescope oldfiles cwd_only=true<cr><cr>",
  { noremap = true, silent = true, desc = "Open last files" }
)

-- TODO: later on
-- flutter tools status line
-- function _G.statusLine()
--  return vim.g.flutter_tools_decorations.app_version
--end
-- vim.opt.statusline = "%!v:statusLine()"

-- add context menu
vim.cmd([[:amenu 10.100 ContextMenu.Definition <cmd>:Telescope lsp_defintions<CR>]])
vim.cmd([[:amenu 10.110 ContextMenu.Peek\ Definition <cmd>:Lspsaga peek_definition<CR>]])
vim.cmd([[:amenu 10.120 ContextMenu.Type\ Definition <cmd>:Telescope lsp_type_definitions<CR>]])
vim.cmd([[:amenu 10.130 ContextMenu.Implementations <cmd>:Telescope lsp_implementations<CR>]])
vim.cmd([[:amenu 10.140 ContextMenu.References <cmd>:Telescope lsp_references<CR>]])
vim.cmd([[:amenu 10.150 ContextMenu.-sep- *]])
vim.cmd([[:amenu 10.160 ContextMenu.Rename <cmd>:Lspsaga rename<CR>]])
vim.cmd([[:amenu 10.170 ContextMenu.Code\ Actions <cmd>:Lspsaga code_action<CR>]])

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup ContextMenu<CR>")
vim.keymap.set("n", "<leader>m", "<cmd>:popup ContextMenu<CR>")
