-- copilot.lua provides GitHub Copilot inline ghost-text suggestions while
-- typing. Suggestions appear automatically; accept, cycle, and dismiss keys
-- are defined centrally in CharlesTheIX.key_bindings.

return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = false,
          prev = false,
          dismiss = false,
          toggle_auto_trigger = false,
        },
      },
    },
  },
}
