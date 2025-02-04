return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'path' },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.confirm{
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
            }),
        })
    end
}
