--[[
w --> snippet will not expand at word boundaries, wordTrig=true (by default);
r --> regular trigger, regTrig=false;
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
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta
local snippet = require('luasnip').extend_decorator.apply(s,
  {
    regTrig = true,
    snippetType = "autosnippet",
  }
)

local wrA = {
  snippet(
    {
      trig = '([aer])ref',
      dscr = 'reference (autoexpand)',
    },
    fmta(
      [[ ~\<>ref{<>}<> ]],
      { f(function (_, snip)
          refs = { a = "auto", e = "eq", r = "", }
          return refs[snip.captures[1]]
        end),
        c(1, {
				  r(nil, "key"),
				  sn(nil, fmta([[<>:<>]], { t("eq"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("fig"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("tab"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("sec"), r(1, "key") }) ),
        }),
        i(0)
      }
    ),
    { condition = in_text }
  ),
}

return wrA
