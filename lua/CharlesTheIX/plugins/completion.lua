-- blink.cmp drives completion from LSP responses, filesystem paths,
-- friendly-snippets, and words in open buffers; it also shows documentation
-- and function signatures. It registers client capabilities through
-- `vim.lsp.config('*')` when it loads, so it is deliberately not lazy-loaded by
-- an event: servers in CharlesTheIX.plugins.lsp must start with those
-- capabilities already in place. blink.cmp defers its heavy work internally.
--
-- Keys are kept distinct from Copilot's inline suggestions (<C-l> accepts the
-- ghost text, <C-y> accepts the popup item).

return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
