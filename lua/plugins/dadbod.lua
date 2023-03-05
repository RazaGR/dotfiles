-- Database
return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    config = function()
      require("config.dadbod").setup()
    end,
    keys = {
      {
        "<leader>Dt",
        "<Cmd>DBUIToggle<Cr>",
        desc = "Toggle DBUI",
      },
      {
        "<leader>Dc",
        "<Cmd>DBUIAddConnection<Cr>",
        desc = "Add DBUI connection",
      },
      {
        "<leader>Df",
        "<Cmd>DBUIFindBuffer<Cr>",
        desc = "Find DBUI buffer",
      },
      {
        "<leader>Dn",
        "<Cmd>DBUIRenameBuffer<Cr>",
        desc = "Rename DBUI buffer",
      },
      {
        "<leader>Dl",
        "<Cmd>DBUILastQueryInfo<Cr>",
        desc = "DBUI last query info",
      },
    },
  },
}
