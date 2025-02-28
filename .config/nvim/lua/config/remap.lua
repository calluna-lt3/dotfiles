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

-- Man pages
vim.keymap.set("n", "<leader>k", ":vert Man<CR>:set signcolumn=no<CR>")
