-- Commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- later make this run x program on current file
-- unsure if ^ is easily possible, unless remap on nvim open, dont want to use tons
-- of if statements or build a table
vim.keymap.set("n", "<leader>rr",
    function()
        vim.cmd(":w")
        vim.cmd("!racket %:p")
    end
)

-- Commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- later make this run x program on current file
-- unsure if ^ is easily possible, unless remap on nvim open, dont want to use tons
-- of if statements or build a table
vim.keymap.set("n", "<leader>rr",
    function()
        vim.cmd(":w")
        vim.cmd("!racket %:p")
    end
)

vim.keymap.set("n", "<leader>rp",
    function()
        vim.cmd(":w")
        vim.cmd("!python3 %:p")
    end
)

vim.keymap.set("n", "<leader>rg",
    function()
        vim.cmd(":w")
        vim.cmd("!go run %:p")
    end
)

vim.keymap.set("n", "<leader>rm",
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

-- Vim command window --> insert mode
vim.keymap.set("n", "<C-f>", "q:i")

