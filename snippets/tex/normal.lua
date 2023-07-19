--[[ Imports ]]
local make_condition = require("luasnip.extras.conditions").make_condition
local conditions = require("user.snippets.tex.utils.conditions")
local in_text = make_condition(conditions.in_text)
local in_math = make_condition(conditions.in_math)

local M = {
	s(
		{ trig = "link", name = "link", dscr = "Link reference" },
		fmta(
      [[\href{<>}{<>}<>]],
      { i(1, "link"), i(2, "title"), i(0) }
    ),
    { show_condition = in_text }
	),
	s(
		{ trig = "lab", name = "labels", dscr = "Different label styles" },
    fmta([[
    \label{<>}<>
    ]],
      { c(1,{
				  r(nil, "key"),
				  sn(nil, fmta([[<>:<>]], { t("eq"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("fig"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("tab"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("sec"), r(1, "key") }) ),
		    }),
        i(0)
      },
      { stored = {
	      -- key passed to restoreNodes.
	      ["key"] = i(1)
	      }
      }
    ),
    { show_condition = in_text }
  ),
	s(
		{ trig = "ref", name = "references", dscr = "Different reference styles" },
    fmta([[
    ~\ref{<>}
    ]],
      { c(1,{
				  r(nil, "key"),
				  sn(nil, fmta([[<>:<>]], { t("fig"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("tab"), r(1, "key") }) ),
				  sn(nil, fmta([[<>:<>]], { t("sec"), r(1, "key") }) ),
		    }),
      },
      { stored = {
	      -- key passed to restoreNodes.
	      ["key"] = i(1)
	      }
      }
    ),
    { show_condition = in_text }
  ),
  s(
		{
      trig = "incfig",
      dscr = [[\begin{figure}...\incfig{...}...\end{figure}]],
      docstring = ""
    },
		fmta(
			[[
      \begin{figure}[H]
        \centering
		        \incfig[<>]{<>}
	       \caption{<>}
	       \label{fig:<>}
      \end{figure}
      ]],
			{ i(1), d(2, function(_, snip)
          local res, env = {}, snip.env
          for _, val in ipairs(env.LS_SELECT_RAW) do table.insert(res, val) end
          return sn(nil, { i(1, res) })
        end, {}),
        i(3), rep(2)
      }
		),
    { show_condition = in_text }
	),
	s(
		{
      trig = "includegraphics",
      dscr = [[\begin{figure}...\includegraphics{...}...\end{figure}]]
    },
		fmta(
			[[
      \begin{figure}[H]
	      \begin{center}
		      \includegraphics[width=<>\textwidth]{<>/<>}
	      \end{center}
	      \caption{<>}
	      \label{fig:<>}
      \end{figure}
      ]],
			{ i(1), i(2, "figures"),
        i(3, "title"), i(4),
        rep(3)
      }
		),
    { show_condition = in_text }
	),
	s(
		{ trig = "minipage", dscr = "minipage environment" },
		fmta(
			  [[
      \begin{minipage}{<>\textwidth}
        <>
      \end{minipage}]],
			{ c(1, { i(nil), t("0.5"), t("0.33") }), i(0) },
      { show_condition = in_text }
		)
	),
  --[[ TODO:
  make reg snippet for tabular environment ]]
	s(
		{ trig="tabular", dscr="tabular environment" },
		fmta(
			[[
    \begin{tabular}{<>}
      <>
    \end{tabular}]],
			{ c(1, {
        t(""), 
        sn(nil, fmta([[|<>|<>|]], {i(1), i(2)}))
      }), i(2), }
		),
    { show_condition = in_text }
	),

  -- Sections
	s(
		{ 
      trig = "sec",
      name = [[\section]],
      dscr = [[\sec/subsec/subsubsection]]
    },
		fmta(
			[[ \<>tion<>{<>}<>

        <>]],
			{ 
        c(1,
          {
            t "sec", t "subsec", t "subsubsec"
          }
        ),
        c(2, 
          {
            t "" , t "*"
          }
        ),
        i(3),
        c(4, 
          {
            t "" , 
            sn(nil, fmta([[\label{<>:<>}]],
              { t "sec", i(1) }
            ))
          }
        ),
        i(0)
      }
    ),
    { show_condition = in_text }
	),
}

return M
