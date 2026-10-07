-- Central home for built-in and plugin keymaps. Plugin mappings live here so
-- they remain discoverable in one place; command-based mappings let lazy.nvim
-- load the relevant plugin on demand. LSP mappings are the exception: they are
-- installed buffer-locally by LspAttach so they exist only where a language
-- server is active.

-- Command Aliases
vim.api.nvim_create_user_command("Q" , "q<bang>" , { bang = true, desc = 'Alias for :q[!]'  })
vim.api.nvim_create_user_command("W" , "w<bang>" , { bang = true, desc = 'Alias for :w[!]'  })
vim.api.nvim_create_user_command("WQ", "wq<bang>", { bang = true, desc = 'Alias for :wq[!]' })

-- Leader Remaps
vim.keymap.set("n", "<leader>w" , "<C-w>"   , { desc = 'Enter window mode'                                                                         })
vim.keymap.set("n", "<leader>yf", "gg0vG$y" , { desc = 'Yank the entire file'                                                                      })
vim.keymap.set("n", "<leader>af", "gg0vG$"  , { desc = 'Select the entire file'                                                                    })
vim.keymap.set("n", "<leader>=" , "gg0vG$=" , { desc = 'Format the entire file'                                                                    })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Return to [p]roject [v]iew from buffer'                                                    })
vim.keymap.set("n", "<leader>q" , "vepvby"  , { desc = 'Pastes the buffer over the word and then re-yanks the word to keep the same buffer stored' })

-- General Key Remaps
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll up half a page'                                 })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll down half a page'                               })
vim.keymap.set("n", "J"    , "mzJ`z"  , { desc = 'Join the current line with the next line'              })
vim.keymap.set("n", "n"    , "nzzzv"  , { desc = 'Center the screen after jumping to the next match'     })
vim.keymap.set("n", "N"    , "Nzzzv"  , { desc = 'Center the screen after jumping to the previous match' })

-- Visual Mode Line Movement Key Remaps
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move the selected lines up'   })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move the selected lines down' })

-- Spelling
vim.keymap.set("n", "]s", "]s", { desc = "Next misspelled word"                   }) 
vim.keymap.set("n", "[s", "[s", { desc = "Previous misspelled word"               })
vim.keymap.set("n", "z=", "z=", { desc = "Suggest spelling corrections"           })
vim.keymap.set("n", "zg", "zg", { desc = "Add word to dictionary"                 })
vim.keymap.set("n", "zw", "zw", { desc = "Mark word as incorrect"                 })

-- Code Folding Key Remaps
vim.keymap.set("n", "za", "za", { desc = "Toggle code collapse under the cursor"  })
vim.keymap.set("n", "zc", "zc", { desc = "Collapse the code under the cursor"     })
vim.keymap.set("n", "zo", "zo", { desc = "Open the code under the cursor"         })
vim.keymap.set("n", "zM", "zM", { desc = "Close all code blocks in the buffer"    })
vim.keymap.set("n", "zR", "zR", { desc = "Open all the code blocks in the buffer" })

-- Harpoon: add the current file, open the project list, and jump to a mark.
vim.keymap.set("n", "<leader>ha", function()
  require("harpoon"):list():add()
end, { desc = "[H]arpoon [A]dd file" })

vim.keymap.set("n", "<leader>hf", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[H]arpoon [F]ile menu" })

for index = 1, 9 do
  local slot = index
  vim.keymap.set("n", "<leader>h" .. slot, function()
    require("harpoon"):list():select(slot)
  end, { desc = "Harpoon file " .. slot })
end

-- Telescope: search files, text, buffers, help, mappings, and recent files.
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>" , { desc = "[S]earch [F]iles"        })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>"  , { desc = "[S]earch by [G]rep"      })
vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>"    , { desc = "[S]earch [B]uffers"      })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>"  , { desc = "[S]earch [H]elp"         })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>"    , { desc = "[S]earch [K]eymaps"      })
vim.keymap.set("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>"   , { desc = "[S]earch recent files"   })

-- Copilot Chat: toggle the chat panel from normal or visual mode.
vim.keymap.set({ "n", "x" }, "<leader>ac", "<cmd>CopilotChatToggle<cr>", {
  desc = "[A]I [C]hat toggle",
})

-- Copilot inline suggestions: use Control keys instead of terminal Meta/Option.
vim.keymap.set("i", "<C-l>", function()
  require("copilot.suggestion").accept()
end, { desc = "Accept Copilot suggestion" })

vim.keymap.set("i", "<C-Right>", function()
  require("copilot.suggestion").next()
end, { desc = "Next Copilot suggestion" })

vim.keymap.set("i", "<C-Left>", function()
  require("copilot.suggestion").prev()
end, { desc = "Previous Copilot suggestion" })

vim.keymap.set("i", "<C-]>", function()
  require("copilot.suggestion").dismiss()
end, { desc = "Dismiss Copilot suggestion" })

-- Start GitHub Copilot's interactive sign-in flow when needed.
vim.keymap.set("n", "<leader>pa", "<cmd>Copilot auth<cr>", {
  desc = "[P]ilot [A]uthenticate",
})

-- LSP: buffer-local mappings applied whenever a language server attaches.
-- Neovim 0.11 already provides grn (rename), gra (code action), K (hover) and
-- [d / ]d (diagnostics); the maps below add VS Code style navigation and route
-- list-producing requests through Telescope.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CharlesTheIX.lsp.attach", { clear = true }),
  callback = function(event)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("n", "gd" , "<cmd>Telescope lsp_definitions<cr>"      , "[G]oto [D]efinition"       )
    map("n", "gD" , vim.lsp.buf.declaration                   , "[G]oto [D]eclaration"      )
    map("n", "grr", "<cmd>Telescope lsp_references<cr>"       , "[G]oto [R]eferences"       )
    map("n", "gri", "<cmd>Telescope lsp_implementations<cr>"  , "[G]oto [I]mplementation"   )
    map("n", "grt", "<cmd>Telescope lsp_type_definitions<cr>" , "[G]oto [T]ype definition"  )

    map("n"            , "<leader>cr", vim.lsp.buf.rename     , "[C]ode [R]ename"           )
    map({ "n", "x" }   , "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction"           )
    map("n"            , "<leader>cd", vim.diagnostic.open_float, "[C]ode [D]iagnostic float")
    map("n"            , "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>"           , "[C]ode [S]ymbols in document")
    map("n"            , "<leader>cw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"  , "[C]ode symbols in [W]orkspace")
    map("n"            , "<leader>cl", "<cmd>Telescope diagnostics<cr>"                    , "[C]ode diagnostic [L]ist")

    map("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, "[C]ode [F]ormat buffer")
  end,
})
