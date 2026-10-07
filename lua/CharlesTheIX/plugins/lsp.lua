-- Language server support for Lua, TypeScript/JavaScript, Zig, JSON, HTML, CSS,
-- Bash, and Vimscript. mason.nvim installs the general-purpose servers,
-- nvim-lspconfig ships their default configurations, and mason-lspconfig
-- enables installed servers through Neovim 0.11's built-in `vim.lsp.enable`.
-- zls is handled separately so its version can follow the system Zig compiler.
--
-- Diagnostics are shared editor-wide. Buffer-local navigation, actions, symbol
-- searches, and formatting mappings are created by the LspAttach autocmd in
-- CharlesTheIX.key_bindings so they only exist while a server is attached.

-- Servers installed and managed by mason. zls is deliberately absent: it must
-- match the Zig toolchain in use, so it is taken from the system PATH instead.
local mason_servers = {
  "bashls",
  "cssls",
  "html",
  "jsonls",
  "lua_ls",
  "ts_ls",
  "vimls",
}

-- Resolve zls from the system PATH while ignoring mason's bin directory, which
-- mason prepends to PATH. A mason-installed zls can lag behind the Zig
-- compiler in use, and a mismatched pair fails to analyse the project.
local function system_zls()
  local mason_bin = vim.fs.normalize(vim.fn.stdpath("data") .. "/mason/bin")
  local separator = vim.fn.has("win32") == 1 and ";" or ":"

  for dir in vim.gsplit(vim.env.PATH or "", separator, { trimempty = true }) do
    if vim.fs.normalize(dir) ~= mason_bin then
      local candidate = vim.fs.joinpath(dir, "zls")

      if vim.fn.executable(candidate) == 1 then
        return candidate
      end
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspStart", "LspInstall" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      vim.diagnostic.config({
        severity_sort = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, source = "if_many" },
        float = { border = "rounded", source = "if_many" },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        } or true,
      })

      -- Teach lua_ls about the Neovim runtime so editing this configuration
      -- does not produce spurious `vim` global diagnostics.
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = mason_servers,
        automatic_enable = { exclude = { "zls" } },
      })

      local zls = system_zls()

      if zls then
        vim.lsp.config("zls", { cmd = { zls } })
        vim.lsp.enable("zls")
      else
        vim.notify(
          "zls not found on PATH; Zig language support is disabled. Install it alongside your Zig toolchain (e.g. `brew install zls`).",
          vim.log.levels.WARN,
          { title = "LSP" }
        )
      end
    end,
  },
}
