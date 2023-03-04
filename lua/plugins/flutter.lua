return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("flutter-tools").setup({
        flutter_path = "/usr/local/Frameworks/flutter/bin/flutter",
      })
    end,
  },
}
