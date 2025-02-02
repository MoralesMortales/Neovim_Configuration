--tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--search
vim.cmd("set number")
vim.cmd("set rnu")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

--terminal
vim.cmd("set hidden")

--clipboard
vim.cmd("set clipboard=unnamedplus")

vim.g.mapleader = ","

-- Open NeoTree on Startup
vim.cmd('autocmd VimEnter * Neotree reveal left')

-- Deactivate Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

