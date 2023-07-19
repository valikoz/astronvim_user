--[[
w --> s will not expand at word boundaries, wordTrig=true (by default);
r --> regular trigger, regTrig=false;
A --> auto expand, snippetType="autosnippet".
]]
local make_condition = require("luasnip.extras.conditions").make_condition
local conditions = require("user.snippets.tex.utils.conditions")
local in_text = make_condition(conditions.in_text)

local wrA = {
  s(
    {
      trig = '([aer])ref',
      dscr = 'reference (autoexpand)',
      regTrig = true,
      snippetType = "autosnippet",
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
