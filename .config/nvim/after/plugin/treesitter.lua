require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "python", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = {"latex"},
    additional_vim_regex_highlighting = false,
  },

}
