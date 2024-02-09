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

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end


return {
    s(
        { trig='ff', snippetType='autosnippet' },
        {
            t('\\frac{'),
            i(1),
            t('}{'),
            i(2),
            t('}'),
        }
    ),

    s(
        { trig='eq', snippetType='autosnippet' },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],

            { i(1) }
        )
    ),

    s(
        { trig='beg', regTrig=false, wordTrig=false },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1)
            },
            { condition = line_begin }
        )
    ),
}
