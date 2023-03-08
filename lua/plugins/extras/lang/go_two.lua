return {

  -- add Go+more to treesitter
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

  -- correctly setup lspconfig for Go
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
      -- example to setup with typescript.nvim
      golangci_lint_ls = function()
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig/configs")

        if not configs.golangcilsp then
          configs.golangcilsp = {
            default_config = {
              cmd = { "golangci-lint-langserver" },
              root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
              init_options = {
                command = {
                  "golangci-lint",
                  "run",
                  "--enable-all",
                  "--disable",
                  "lll",
                  "--out-format",
                  "json",
                  "--issues-exit-code=1",
                  "--allow-parallel-runners",
                },
              },
            },
          }
        end
        lspconfig.golangci_lint_ls.setup({
          filetypes = { "go", "gomod" },
        })
        return true
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
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
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
