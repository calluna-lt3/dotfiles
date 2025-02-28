vim.g.mapleader = ' '

vim.opt.guicursor = ''
vim.opt.mouse = ''

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'

vim.opt.list = true
vim.opt.listchars = 'tab:> ,trail:$'

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Highlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank {higroup = 'IncSearch', timeout = 50}
    end,
})
