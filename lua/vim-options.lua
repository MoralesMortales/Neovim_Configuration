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

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

vim.g.mapleader = ","

-- Open NeoTree on Startup
vim.cmd('autocmd VimEnter * Neotree reveal left')

-- Deactivate Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

