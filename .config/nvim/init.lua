local vim = vim

vim.g.mapleader = ' '
vim.opt.guicursor = ''
vim.opt.mouse = ''
vim.opt.winborder = 'single'

vim.opt.number = true
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

vim.pack.add({
    { src = 'https://github.com/jaredgorski/fogbell.vim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/mbbill/undotree' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/ej-shafran/compile-mode.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim', branch = '0.1.x' },
    { src = 'https://github.com/Saghen/blink.cmp', branch = '1.x' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/mfussenegger/nvim-lint' },
})

local function remove_unused_plugins()
    local plugins = vim.pack.get()
    local unused = {}
    for i = 1, #plugins do
        local plugin = plugins[i]
        if not plugin.active then
            table.insert(unused, plugin.spec.name)
        end
    end

    if #unused > 0 then
        vim.pack.del(unused)
    end
end
remove_unused_plugins()

vim.cmd('colorscheme fogbell')

require('mason').setup()

vim.g.compile_mode = {
    default_command = '',
    recompile_no_fail = true,
    auto_jump_to_first_error = false,
    debug = false,
}

vim.lsp.config.clangd.cmd = { 'clangd', '--background-index' }

local lint = require('lint')
lint.linters_by_ft = {
    python = { 'mypy' },
    lua = { 'luacheck' },
}

lint.linters.mypy.args = {
    '--show-column-numbers',
    '--show-error-end',
    '--hide-error-context',
    '--no-color-output',
    '--no-error-summary',
    '--no-pretty',
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        -- lint.try_lint()
    end,
})

local conform = require('conform')
conform.setup({
    formatters_by_ft = {
        python = { 'black' },
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        c = { 'clang-format' },
    },
})
conform.formatters.stylua = {
    prepend_args = { '--indent-type', 'Spaces', '--quote-style', 'ForceSingle' },
}

vim.lsp.enable({
    'lua_ls',
    'clangd',
    'rust_analyzer',
    'jedi_language_server',
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
        vim.keymap.set('n', 'E', '<CMD>lua vim.diagnostic.open_float()<CR>', opts)
    end,
})

local cmp = require('blink-cmp')
cmp.setup({
    keymap = {
        preset = 'none',
        ['<C-j>'] = {
            function()
                cmp.show()
                cmp.select_next()
            end,
        },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-l>'] = { 'select_and_accept', 'fallback' },
        -- seems cool in theory but very buggy in practice
        -- ['<C-l>'] = {
        --     function()
        --         cmp.show_and_insert_or_accept_single()
        --         cmp.select_and_accept()
        --     end,
        -- },
    },
    fuzzy = { implementation = 'lua' },
})

-- system yank/system paste
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>sy', [["+y]])
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>sp', [["+p]])

-- stay centered
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set({ 'n', 'v' }, 'gk', 'ggzz')
vim.keymap.set({ 'n', 'v' }, 'gj', 'Gzz')

-- bubbling lines (https://mkaz.blog/working-with-vim/lines#bubble-up-lines)
vim.keymap.set('v', '<C-j>', [[:m '>+1<CR> gv=gv]])
vim.keymap.set('v', '<C-k>', [[:m '<-2<CR> gv=gv]])

vim.keymap.set('n', '<leader>k', '<CMD>vert Man<CR><CMD>set signcolumn=no<CR>')

vim.keymap.set('n', '<leader>o', '<CMD>set nohls<CR>')
vim.keymap.set('n', '/', '<CMD>set hls<CR>/')
vim.keymap.set('n', '#', '<CMD>set hls<CR>#')
vim.keymap.set('n', '*', '<CMD>set hls<CR>*')

vim.keymap.set('n', '<leader>v', vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>ls', builtin.grep_string)
vim.keymap.set('n', '<leader>lr', builtin.lsp_references)
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions)
vim.keymap.set('n', '<leader>lf', function()
    conform.format()
end)
vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename)

vim.keymap.set('n', '<leader>u', '<CMD>UndotreeToggle<CR>')

vim.keymap.set('n', '<leader>c', '<CMD>below Compile<CR>')
vim.keymap.set('n', '<leader>r', '<CMD>w<CR><CMD>below Recompile<CR>')
vim.keymap.set('n', '<leader>n', '<CMD>NextError<CR>')
