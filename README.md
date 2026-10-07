# Neovim setup

The active configuration is loaded from [lua/CharlesTheIX/](lua/CharlesTheIX/)
through [init.lua](init.lua), with plugins managed by lazy.nvim.
All custom and plugin keymaps are defined in
[lua/CharlesTheIX/key_bindings.lua](lua/CharlesTheIX/key_bindings.lua).

## Harpoon

[Harpoon 2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) provides
persistent lists of frequently used files, scoped to Neovim's working directory.
Start Neovim from your project directory (or use `:cd`) to choose the list.

Restart Neovim to load the new spec; lazy.nvim installs missing plugins on
startup, or you can use `:Lazy install`. Harpoon reuses Plenary and requires no
extra external tools.

| Key (normal mode) | Action |
| --- | --- |
| `Space h a` | Add the current file to the list |
| `Space h f` | Toggle the file menu |
| `Space h 1` through `Space h 9` | Jump directly to the corresponding marked file |

In the menu, press `Enter` to open a file. Edit the list with normal Vim commands
to remove or reorder entries, then toggle the menu with `Space h f` to apply
the changes. Marks are persisted outside the repository in Neovim's data directory.

## Telescope

[Telescope](https://github.com/nvim-telescope/telescope.nvim) provides fuzzy
pickers for finding files, searching text, switching buffers, and browsing help.
The plugin loads when one of its picker commands is used.

| Key (normal mode) | Action |
| --- | --- |
| `Space s f` | Find files |
| `Space s g` | Search project text with live grep |
| `Space s w` | Search for the word under the cursor |
| `Space s b` | Choose an open buffer |
| `Space s h` | Search help |
| `Space s k` | Search keymaps |
| `Space s .` | Open a recent file |

## Statusline

[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) replaces the
built-in statusline with one global bar shared by all splits. It uses the Rose
Pine theme and shows:

- the current mode;
- Git branch and added, modified, or removed line counts;
- error, warning, information, and hint diagnostic counts;
- the current file's path and modified/read-only state;
- language servers attached to the current buffer;
- character encoding, line-ending format, and filetype;
- progress through the file and the cursor's line and column.

[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) supplies
filetype icons. The configured JetBrainsMono Nerd Font is therefore expected to
be available in the UI running Neovim. lualine loads after startup and requires
no mappings or external executables.

## Language servers (LSP)

Language intelligence is provided by Neovim's built-in LSP client together with
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for server
definitions, [mason.nvim](https://github.com/mason-org/mason.nvim) for
installing servers, and
[mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) to
enable each installed server. The spec lives in
[lua/CharlesTheIX/plugins/lsp.lua](lua/CharlesTheIX/plugins/lsp.lua) and loads
when a file is opened.

### Requirements and setup

- Neovim 0.11 or newer.
- Mason installs these servers automatically on first start: `bashls`, `cssls`,
  `html`, `jsonls`, `lua_ls`, `ts_ls` and `vimls`. Watch `:Mason` for progress
  and `:checkhealth mason` for missing prerequisites such as Node.js.
- **Zig is deliberately excluded from Mason.** `zls` must match the Zig compiler
  it analyses, so the configuration uses the `zls` found on your `PATH`
  (for example `brew install zls` next to your `zig` install) and ignores any
  copy inside Mason's `bin` directory. If no suitable `zls` is found, a warning
  is shown on startup and Zig support stays off.
- Use `:LspInfo` to see the clients attached to the current buffer, and
  `:LspInstall` to add a server for the current filetype.

### Keys (normal mode unless noted)

`K` (hover), `grn` (rename), `gra` (code action), `gO` (document symbols) and
`[d` / `]d` (previous/next diagnostic) are Neovim's own defaults. The
configuration adds the following buffer-local maps when a server attaches:

| Key | Action |
| --- | --- |
| `g d` | Go to definition (Telescope picker) |
| `g D` | Go to declaration |
| `g r r` | List references (Telescope picker) |
| `g r i` | List implementations (Telescope picker) |
| `g r t` | List type definitions (Telescope picker) |
| `Space c r` | Rename the symbol under the cursor |
| `Space c a` (normal or visual mode) | Code action |
| `Space c d` | Show the diagnostic under the cursor in a float |
| `Space c l` | List diagnostics (Telescope picker) |
| `Space c s` | Document symbols (Telescope picker) |
| `Space c w` | Workspace symbols (Telescope picker) |
| `Space c f` | Format the buffer with the language server |

`Space c f` asks the attached language server to format, which is distinct from
the existing `Space =`, which re-indents the file using Vim's own rules.

## Completion

[blink.cmp](https://github.com/Saghen/blink.cmp) provides the completion popup,
fed by LSP, snippets ([friendly-snippets](https://github.com/rafamadriz/friendly-snippets)),
buffer words and paths, plus signature help. It is intentionally not
lazy-loaded by an event because it registers the LSP client capabilities that
servers need at startup. A prebuilt fuzzy-matching library is downloaded on
first install; no Rust toolchain is required.

| Key (insert mode) | Action |
| --- | --- |
| `Ctrl-Space` | Open the completion menu |
| `Ctrl-N` / `Ctrl-P` | Select the next/previous item |
| `Ctrl-Y` | Accept the selected item |
| `Ctrl-E` | Close the menu |
| `Tab` / `Shift-Tab` | Jump forward/backward in an expanded snippet |

These keys do not clash with Copilot's inline suggestions: `Ctrl-Y` accepts an
item from the popup, while `Ctrl-L` accepts Copilot's ghost text.

## GitHub Copilot Chat

[CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) provides a
vertical chat panel using 40% of the editor width. It loads on demand and reuses
the Plenary dependency. Inline code suggestions are configured separately with
[copilot.lua](https://github.com/zbirenbaum/copilot.lua), described below.

### Requirements and setup

- Neovim 0.10 or newer and curl 8.0 or newer.
- A GitHub account with Copilot access and **Copilot chat in the IDE** enabled in
  [GitHub settings](https://github.com/settings/copilot).

Restart Neovim to pick up the plugin spec. lazy.nvim installs missing plugins
on startup; use `:Lazy install` if needed. No optional native build is configured.

Open chat and submit a prompt to trigger GitHub device sign-in if you are not
already authenticated. Follow the displayed URL and code. Authentication is
handled by the plugin outside this repository; do not put tokens in the config.
This chat authentication is separate from setting up inline completions.

### Keys and commands

| Key | Action |
| --- | --- |
| `Space a c` (normal or visual mode) | Toggle chat open/closed, preserving the conversation |
| `Esc`, then `Space a c` (while typing in chat) | Return to normal mode and toggle chat closed |
| `Ctrl-s` (insert mode in chat) | Submit the prompt |
| `Enter` (normal mode in chat) | Submit the prompt |
| `q` (normal mode in chat) | Close chat |

Chat opens ready for typing. Visual selections can be used as prompt context.
Use `#` followed by `Tab` in chat to discover additional context resources.
Submitted prompts and selected context are sent to GitHub Copilot; opening or
closing the panel does not submit a prompt.

You can also use `:CopilotChatToggle`, `:CopilotChatReset` to clear the conversation,
and `:CopilotChatModels` to choose an available model.

The space-leader toggle avoids terminal-dependent Ctrl/Shift combinations while
keeping existing Vim mappings intact.

## GitHub Copilot inline completion

[copilot.lua](https://github.com/zbirenbaum/copilot.lua) displays Copilot's
suggested code as inline ghost text while you type. It loads on the first
Insert-mode entry, and suggestions trigger automatically. Accepting a
suggestion inserts it into your buffer; it does not apply changes without your
action.

Neovim 0.11 or newer is required. On first use, the plugin downloads its
Copilot language server; the first download requires an internet connection.
Restart Neovim and allow lazy.nvim to install the plugin, then press `Space p a`
or run `:Copilot auth`. Follow the GitHub sign-in instructions in the UI. This
interactive step is necessary: authentication cannot be completed silently by
the configuration. The server's default native binary works on macOS.

| Key while in Insert mode | Action |
| --- | --- |
| `Ctrl-L` (`<C-l>`) | Accept the full suggestion |
| `Ctrl-Right` (`<C-Right>`) | Show the next suggestion |
| `Ctrl-Left` (`<C-Left>`) | Show the previous suggestion |
| `Ctrl-]` (`<C-]>`) | Dismiss the suggestion |

Ctrl-Right and Ctrl-Left cycle Copilot suggestions instead of moving by words
while you are in Insert mode. These mappings are centralized in
[lua/CharlesTheIX/key_bindings.lua](lua/CharlesTheIX/key_bindings.lua).
