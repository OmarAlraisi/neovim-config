vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.linebreak = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>fn', ':e <C-R>=expand("%:p:h") . "/" <cr>', { desc = 'Create new file in the same directory of the opened file' })
