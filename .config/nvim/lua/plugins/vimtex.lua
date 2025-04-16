return {
    'lervag/vimtex',
    tag = 'v2.16',
    init = function()
        vim.cmd([[
            let g:vimtex_view_method = "zathura"
            let g:vimtex_compiler_method = 'latexmk'
            let g:vimtex_quickfix_mode=2
            let g:tex_conceal='abdmg'
            set conceallevel=2
        ]])
    end,
}
