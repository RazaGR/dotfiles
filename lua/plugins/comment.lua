return {
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    -- opts = {
    --   context_commentstring = {
    --     enable = true,
    --     enable_autocmd = false,
    --   },
    --   pre_hook = function()
    --     return require("ts_context_commentstring.internal").create_pre_hook()
    --   end,
    -- },
  },
}
