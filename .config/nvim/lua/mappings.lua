require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
local del = vim.keymap.del
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
--n mode
vim.keymap.set("n","sh","<C-w>h",{desc = "Move right"})
vim.keymap.set("n", "sk", "<C-w>k", {desc = "Move up"})
vim.keymap.set("n", "sj", "<C-w>j" ,{desc = "Move down"})
vim.keymap.set("n","sl", "<C-w>l", {desc = "Move left"})
-- t mode
vim.keymap.set("t","sh","<C-w>h",{desc = "Move right"})
vim.keymap.set("t", "sk", "<C-w>k", {desc = "Move up"})
vim.keymap.set("t", "sj", "<C-w>j" ,{desc = "Move down"})
vim.keymap.set("t","sl", "<C-w>l", {desc = "Move left"})

vim.api.nvim_set_keymap('n', '<leader>cr', '<Plug>SnipRun', {silent = true,desc="Run code"})
vim.keymap.set("n","<leader>wz",":ZenMode<CR>",{desc = "Zen mode"})

vim.keymap.set("n","<leader>wc",":close",{desc="Close other window"})
vim.keymap.set("n","<leader>q",":q<CR>",{desc="Close a window"})
vim.keymap.set("n","<leader>wh",":split<CR>",{desc = "Horizontal window split"})
vim.keymap.set("n","<leader>wv",":vsplit<CR>",{desc = "Vertical window split"})
vim.keymap.set('t', '<C-Esc>', [[<C-\><C-n>]],{desc = "Exit on terminal"})
del("n","<leader>n")
del("n","<leader>ch")
del("n","<leader>fh")
del("n","<leader>h")
del("n","<leader>v")
