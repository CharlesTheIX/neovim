-- CopilotChat.nvim adds an on-demand GitHub Copilot conversation in a vertical
-- panel occupying 40% of the editor. Plenary is its required Lua utility
-- dependency. Use <leader>ac or a CopilotChat command to load it; a visual
-- selection becomes prompt context. The chat buffer owns its submission keys:
-- Ctrl-S in Insert mode and Enter in Normal mode.

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatReset",
      "CopilotChatStop",
      "CopilotChatModels",
      "CopilotChatPrompts",
    },
    opts = {
      auto_insert_mode = true,
      window = {
        layout = "vertical",
        width = 0.4,
      },
    },
  },
}
