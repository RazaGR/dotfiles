return {
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_filetypes = { xml = false }
      vim.cmd([[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]])
      vim.g.copilot_no_tab_map = true
      vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
    end,
  },
}
