return {
    'ej-shafran/compile-mode.nvim', branch = 'latest',
    dependencies = { 'nvim-lua/plenary.nvim' },
    key = { '<leader>c', '<leader>r', '<leader>n' },
    config = function ()
        vim.g.compile_mode = {
            default_command = "",
            recompile_no_fail = true,
            auto_jump_to_first_error = true,
        }
        vim.keymap.set("n", "<leader>c", ":below Compile<CR>")
        vim.keymap.set("n", "<leader>r", ":w<CR>:below Recompile<CR>")
        vim.keymap.set("n", "<leader>n", ":NextError<CR>")
    end
}
