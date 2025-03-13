return {
    'ej-shafran/compile-mode.nvim', tag = "v5.*",
    dependencies = { 'nvim-lua/plenary.nvim' },
    key = { '<leader>c', '<leader>r', '<leader>n' },
    config = function ()
        vim.g.compile_mode = {}
        vim.keymap.set("n", "<leader>c", ":below Compile<CR>")
        vim.keymap.set("n", "<leader>r", ":w<CR>:below Recompile<CR>")
        vim.keymap.set("n", "<leader>n", ":NextError<CR>")
    end
}
