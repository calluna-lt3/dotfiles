local ls = require('luasnip')
local s = ls.s -- snippet
local i = ls.i -- insert node
local t = ls.t -- text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require('luasnip.extras').rep


-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end


return {
    s(
        { trig='"' },
        fmta(
            [[
                "<>"<>
            ]],
            {
                d(1, get_visual),
                i(0)
            }
        )
    ),
}
