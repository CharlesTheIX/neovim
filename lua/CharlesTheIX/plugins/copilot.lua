-- copilot.lua provides GitHub Copilot inline ghost-text suggestions and loads
-- on the first Insert-mode entry or :Copilot command. The panel is disabled so
-- suggestions stay inline, while every plugin-default key is disabled to avoid
-- conflicts with blink.cmp. Accept, cycle, dismiss, and authentication mappings
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
