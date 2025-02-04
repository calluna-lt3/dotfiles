-- Commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy/paste system clipboard
vim.keymap.set({"n", "v"}, "<leader>sy", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>sp", [["+p]])

-- Put from register, dont yank deleted content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Center screen on various movements
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set({"n", "v"}, "gk", "ggzz")
vim.keymap.set({"n", "v"}, "gj", "Gzz")

-- Bubbling lines (https://mkaz.blog/working-with-vim/lines#bubble-up-lines)
vim.keymap.set("v", "<C-k>", [[:m '<-2<CR>gv=gv]])
vim.keymap.set("v", "<C-j>", [[:m '>+1<CR>gv=gv]])


-- idk where to put this
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Highlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank {higroup = 'IncSearch', timeout = 50}
    end,
})
