return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "angular",
        "bash",
        "c_sharp",
        "css",
        "csv",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vue",
        "yaml",
        "zig"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end
}
