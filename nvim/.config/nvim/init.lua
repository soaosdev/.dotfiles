vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.conceallevel = 3
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Settings for enforcing good habits
vim.o.mouse=''
vim.keymap.set({'n', 'i', 'v'}, '<Up>', '<Nop>');
vim.keymap.set({'n', 'i', 'v'}, '<Down>', '<Nop>');
vim.keymap.set({'n', 'i', 'v'}, '<Left>', '<Nop>');
vim.keymap.set({'n', 'i', 'v'}, '<Right>', '<Nop>');

require("config.lazy")

require("config.yarnspinner")
