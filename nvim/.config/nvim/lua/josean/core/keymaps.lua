vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- yanky plugin
keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "Yank with Yanky plugin" })
keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Put after with Yanky plugin" })
keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Put before with Yanky plugin" })
keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "GPut after with Yanky plugin" })
keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "GPut before with Yanky plugin" })

keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)", { desc = "Go to previous Yanky entry" })
keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)", { desc = "Go to next Yanky entry" })

-- leap plugin
keymap.set({ "n", "x", "o" }, "b", "<Plug>(leap-forward)", { desc = "Leap forward" })
keymap.set({ "n", "x", "o" }, "B", "<Plug>(leap-backward)", { desc = "Leap backward" })
keymap.set({ "n", "x", "o" }, "gb", "<Plug>(leap-from-window)", { desc = "Leap from window" })

-- refactoring plugin
keymap.set({ "n", "x" }, "<leader>rr", function()
  require("telescope").extensions.refactoring.refactors()
end, { desc = "Refactor with Telescope" })

vim.keymap.set("n", "<leader>rp", function()
  require("refactoring").debug.printf({ below = false })
end, { desc = "Print debug info for refactoring" })

vim.keymap.set({ "x", "n" }, "<leader>rv", function()
  require("refactoring").debug.print_var()
end, { desc = "Print variable for refactoring" })

vim.keymap.set("n", "<leader>rc", function()
  require("refactoring").debug.cleanup({})
end, { desc = "Cleanup debug for refactoring" })
