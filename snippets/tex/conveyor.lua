--[[ Imports ]]
local ls = require("luasnip")
local make_condition = require("luasnip.extras.conditions").make_condition
local conditions = require("user.snippets.tex.utils.conditions")
local in_math = make_condition(conditions.in_math)
local no_backslash = conditions.no_backslash
local utils = require('user.snippets.tex.utils')
local toautobs = require('user.snippets.tex.utils.symbols').toautobs
local fortips = require('user.snippets.tex.utils.symbols').fortips

local M = {}

M.setup = function()
  
  local autosnippets = {}
  -- Make auto backslash snippets
  for _, v in pairs(toautobs) do
    for _, settings in ipairs(v) do
      context, opts = settings.context, {}
      context.wordTrig = false
      if string.match(context.trig, "%[.*%]") then
        context.regTrig = true
        context.dscr = "auto backslash (irA)" 
      else
        context.regTrig = false
        if context.dscr == nil then
          context.dscr = "auto backslash (iA)"
        end
      end
      opts.condition = in_math * no_backslash
      snip = utils.bs_snip(context, opts)
      table.insert(autosnippets, snip)
    end
  end

  local snippets = {}
  -- Make normal bs snippets for cmp
  for _, v in pairs(fortips) do
    for _, settings in ipairs(v) do
      context, opts = settings.context, {}
      opts.show_condition = in_math
      -- snip = s(context, nodes, opts)
      snip = utils.bs_snip(context, opts)
      table.insert(snippets, snip)
    end
  end

  ls.add_snippets("tex", autosnippets, {
    type = "autosnippets",
  })

  ls.add_snippets("tex", snippets)

end

return M.setup()
