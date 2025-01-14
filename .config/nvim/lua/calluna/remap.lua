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

-- Vim command window --> insert mode
vim.keymap.set("n", "<C-f>", "q:")

-- TODO: something using substitute :'<,'>s\(.*\)/<something>/g

-- Bubbling lines (taken from some wiki)
vim.keymap.set("v", "<C-k>", [[:m '<-2<CR>gv=gv]])
vim.keymap.set("v", "<C-j>", [[:m '>+1<CR>gv=gv]])

-- Compile & Run
-- TODO: this is kinda trash
vim.keymap.set("n", "<leader>pc",
    function()
        vim.cmd(":w")
        vim.cmd("!./compile.sh")
    end
)
vim.keymap.set("n", "<leader>pr",
    function()
        vim.cmd(":w")
        vim.cmd("!./run.sh")
    end
)

