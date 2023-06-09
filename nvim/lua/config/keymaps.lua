-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Twilight and zen modes
map("n", "<leader>ut", "<CMD>Twilight<CR>", { desc = "Twilight Toggle" })
map("n", "<leader>uz", "<CMD>ZenMode<CR>", { desc = "Zen Mode Toggle" })
map("n", "<leader>uL", "<CMD>set background=light<CR>", { desc = "Light mode" })
map("n", "<leader>uD", "<CMD>set background=dark<CR>", { desc = "Dark mode" })
