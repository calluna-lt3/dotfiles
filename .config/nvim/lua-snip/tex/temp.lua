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


-- kinda bothers me that regex REQUIRES to match rather than optional match
-- (matching start of line would be nice)
return {
    s(
        { trig='([%a]){', regTrig=true, wordTrig=false, snippetType='autosnippet' },
        fmta(
            [[
                <>{<>}
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1)
            }
        )
    ),

    s(
        { trig='([^%a])ff', regTrig = true, wordTrig = false },
        fmta(
            [[
                <>\frac{<>}{<>}
            ]],
            {
              f( function(_, snip) return snip.captures[1] end ),
              i(1),
              i(2)
            }
        )
    ),

    s(
        { trig='eq', regTrig=false, wordTrig=true },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],

            {
                i(1),
            }
        )
    ),

    s(
        { trig='beg', regTrig=false, wordTrig=true },
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
            }
        )
    ),

    s(
        { trig='([^%a])mm', regTrig=true, wordTrig=false },
        fmta(
            [[
                <>\(<>\)
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1)
            }
        )
    ),

    s(
        { trig='([^%a])vec', regTrig=true, wordTrig=false },
        fmta(
            [[
                <>\vec{<>}
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1)
            }
        )
    ),

    s(
        { trig='([^%a])mbb', regTrig=true, wordTrig=false },
        fmta(
            [[
                <>\mathbb{<>}
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1)
            }
        )
    ),

}
