local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

-- TODO: look into supertab when looking into snippets
cmp.setup({
    -- key remappings
    mapping = {

        ['<C-j>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
        ['<C-k>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
    },

    -- preselect first item
    --[[
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }
    ]]
})
