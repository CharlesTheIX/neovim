-- CopilotChat.nvim adds an interactive GitHub Copilot chat panel. Use
-- <leader>ac to toggle it, or its CopilotChat commands; select code first
-- to include a visual selection as context. Prompt submission keys are in
-- the chat buffer (Ctrl-S in Insert mode or Enter in Normal mode).

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
