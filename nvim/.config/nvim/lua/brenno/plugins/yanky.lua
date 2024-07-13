return {
  "gbprod/yanky.nvim",
  opts = {
    preserve_cursor_position = {
      enabled = true,
    },
    ring = {
      history_length = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },
    system_clipboard = {
      sync_with_ring = true,
    },
  },
}
