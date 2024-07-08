return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        keymap = {
          accept = "<M-p>",
        },
      },
    })
  end,
  opts = {},
}
