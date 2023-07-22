--[[
w --> the snippet is only expanded if the word ([%w_]+) before
the cursor matches the trigger entirely, wordTrig=true;
A --> auto expand, snippetType="autosnippet".
]]
--[[ Imports ]]
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta

local make_condition = require("luasnip.extras.conditions").make_condition
local conditions = require("user.snippets.tex.utils.conditions")
local in_math = make_condition(conditions.in_math)
local in_align = make_condition(conditions.in_align)
local snippet = require('luasnip').extend_decorator.apply(s,
  { snippetType = "autosnippet", },
  { condition = in_math, }
)
local utils = require("user.snippets.tex.utils")


local math_wA = {
	snippet(
		{ trig = "//", dscr = "fraction (autoexpand)", docstring = "" },
		fmta([[\frac{<>}{<>}<>]],
      { d(1,
          function(_, snip)
            local res = utils.select_raw(_, snip)
            return  sn(nil,
              {
                c(1,
                  {
                    sn(nil, { r(1, '1', i(1, res)) }),
                    sn(nil,
                      fmta([[(<>)<>]],
                        {
                          r(1, '1'), i(2)
                        }
                      )
                    ),
                    sn(nil,
                      fmta([[\left(<>\right)<>]],
                        {
                          r(1, '1'), i(2)
                        }
                      )
                    )
                  }
                )
              }
            )
          end, {}),
        c(2,
            {
              sn(nil, { r(1, '2', i(1)) }),
              sn(nil,
                fmta([[(<>)<>]],
                  {
                    r(1, '2'), i(2)
                  }
                )
              ),
              sn(nil,
                fmta([[\left(<>\right)<>]],
                  {
                    r(1, '2'), i(2)
                  }
                )
              )
            }
        ), i(0)
      }
    )
  ),
	snippet(
		{ trig = "vec", dscr = [[\vec (wA)]], priority = 998, docstring = [[\vec{}]] },
		fmta([[\<>{<>}<>]],
      {
        f(function(_, snip) return snip.trigger end, {}),
        d(1, function(_, snip)
          local cap = utils.select_raw(_, snip)
          return sn(nil, {i(1, cap)})
        end, {}),
        i(0)
      }
    )
  ),
	snippet(
		{ trig = "hat", dscr = [[\hat (wA)]], docstring = [[\hat{}]] },
		fmta([[\<>{<>}<>]],
      {
        f(function(_, snip) return snip.trigger end, {}),
        d(1, function(_, snip)
          local cap = utils.select_raw(_, snip)
          return sn(nil, {i(1, cap)})
        end, {}),
        i(0)
      }
    )
  ),
	snippet(
		{ trig = "bar", dscr = [[\overline (wA)]], docstring = [[\overline{}]] },
		fmta([[\overline{<>}<>]],
      {
        d(1, function(_, snip)
          local cap = utils.select_raw(_, snip)
          return sn(nil, {i(1, cap)})
        end, {}),
        i(0)
      }
    )
  ),
	snippet(
		{ trig = "dot", dscr = [[\dot (wA)]], docstring = [[\dot{}]] },
		fmta([[\<>{<>}<>]],
      {
        c(1, { t "dot", t "ddot", t "dddot" }),
        d(2, function(_, snip)
          local cap = utils.select_raw(_, snip)
          return sn(nil, {i(1, cap)})
        end, {}),
        i(0)
      }
    )
  ),
	snippet(
		{ trig = "sum", dscr = [[\sum (wA)]] },
		fmta(
			[[
    \sum<> <>
    ]],
      {
        c(1,
          {
            fmta([[_{<>}^{<>}]], {i(1, "i=0"), i(2, "\\infty")}),
            t("")
          }
        ), i(0)
      }
		)
	),
	snippet(
		{ trig = "lim", dscr = [[\lim (wA)]] },
		fmta(
			[[
    \lim_{<>} <>
    ]],
      {
        c(1,
          {
            t(""),
            i(nil, [[t\to\infty]]),
          }
        ), i(0)
      }
		)
	),
  s(
    {
      trig = '==',
      name = '&= align',
      dscr = 'alignment for = in align environment (wA)',
      snippetType = "autosnippet"
    },
    fmta([[ &<> <> \\ ]],
      { c(1, {t("="), t("\\leq"), i(1)}), i(2) }
    ),
    { condition = in_align }
  ),
	snippet(
		{ trig = "dint", dscr = [[\int (wA)]] },
		fmta(
			[[
    \int<> <> \dd <>
    ]],
      {
        c(1,
          {
            fmta([[\limits_{<>}^{<>}]], {i(1, [[-\infty]]), i(2, [[\infty]])}),
            t ""
          }
        ), i(2), i(0),
      }
		)
	),
	snippet(
		{ trig = "part", dscr = "partial derivative (wA)" },
		fmta(
			[[
    \frac{\partial <>}{\partial <>} <>
    ]],
			{ i(1), i(2), i(0) }
		)
	),
}

return math_wA
