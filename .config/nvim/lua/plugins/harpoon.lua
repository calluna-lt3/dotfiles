return {
    'theprimeagen/harpoon',
    keys = {
        { '<leader>a', function() require('harpoon.mark').add_file() end,        mode = 'n'},
        { '<C-e>',     function() require('harpoon.ui').toggle_quick_menu() end, mode = 'n'},
        { '<C-j>',     function() require('harpoon.ui').nav_file(1) end,         mode = 'n'},
        { '<C-k>',     function() require('harpoon.ui').nav_file(2) end,         mode = 'n'},
        { '<C-l>',     function() require('harpoon.ui').nav_file(3) end,         mode = 'n'},
        { '<C-h>',     function() require('harpoon.ui').nav_file(4) end,         mode = 'n'},
    },
}
