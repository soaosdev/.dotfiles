vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.conceallevel = 3

require("config.lazy")

require("config.yarnspinner")
