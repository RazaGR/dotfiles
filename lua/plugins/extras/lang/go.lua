-- local cmp = require("cmp")
return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
      end
    end,
  },
  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gopls" })
      end
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "cmdlineenter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the servers
      servers = {
        golangci_lint_ls = {},
        gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          --[[ analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          } ]]
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        },
      },
    },
    setup = {
      gopls = function()
        require("lspconfig").gopls.setup({
          cmd = { "gopls", "serve", "--debug=localhost:6060" },
          init_options = {
            usePlaceholders = true,
          },
        })
      end,
    },
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   -- enabled = false,
  --   opts = {
  --     servers = {
  --       gopls = {},
  --     },
  --     setup = {
  --       gopls = function()
  --         require("lspconfig").gopls.setup({
  --           capabilities = cmp.lsp.client_capabilities(),
  --           cmd = { "gopls", "serve", "--debug=localhost:6060" },
  --           init_options = {
  --             usePlaceholders = true,
  --           },
  --         })
  --       end,
  --     },
  --   },
  -- },
}
