vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- basic bindings
keymap.set("i", "jk", "<Esc>", {desc = "Exit insert mode"})

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- move to beginning/end of line
keymap.set("n", "H", "^", { desc = "Move to beginning of line" })
keymap.set("n", "L", "$", { desc = "Move to end of line" })

-- terminal
keymap.set("n", "<leader>th", "<C-w>s<C-w>j:terminal<CR>", { desc = "Split horizontal and open terminal" })
keymap.set("n", "<leader>tv", "<C-w>v<C-w>j:terminal<CR>", { desc = "Split horizontal and open terminal" })
keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

