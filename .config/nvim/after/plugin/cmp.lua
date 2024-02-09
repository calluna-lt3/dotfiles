local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- TODO: look into supertab when looking into snippets
cmp.setup({
    formatting = lsp_zero.cmp_format(),

    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },

    mapping = cmp.mapping.preset.insert {
        ['<C-Space>'] = cmp.mapping.confirm({select = true}),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    },
})
