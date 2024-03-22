-- Commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Compile & Run
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

-- Copy/paste system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

-- Center screen on various movements
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "gk", "ggzz")
vim.keymap.set("n", "gj", "Gzz")
vim.keymap.set("v", "gk", "ggzz")
vim.keymap.set("v", "gj", "Gzz")

-- Vim command window --> insert mode
vim.keymap.set("n", "<C-f>", "q:i")

