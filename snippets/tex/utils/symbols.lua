local M = {}

-- args for auto backslash snippets
M.toautobs = {
  greek = {
    {
      context = {
        trig = "[Aa]lpha"
      }
    },
    {
      context = {
        trig = "[Bb]eta"
      }
    },
    {
      context = {
        trig = "[Gg]amma"
      }
    },
    {
      context = {
        trig = "[Dd]elta"
      }
    },
    {
      context = {
        trig = "epsilon",
        priority = 999
      }
    },
    {
      context = {
        trig = "zeta"
      }
    },
    {
      context = {
        trig = "eta"
      }
    },
    {
      context = {
        trig = "[Tt]heta",
        priority = 999
      }
    },
    {
      context = {
        trig = "iota"
      }
    },
    {
      context = {
        trig = "kappa",
        priority = 999
      }
    },
    {
      context = {
        trig = "[Ll]ambda"
      }
    },
    {
      context = {
        trig = "mu"
      }
    },
    {
      context = {
        trig = "nu"
      }
    },
    {
      context = {
        trig = "[Xx]i"
      }
    },
    {
      context = {
        trig = "[Pp]i"
      }
    },
    {
      context = {
        trig = "[Rr]ho"
      }
    },
    {
      context = {
        trig = "[Ss]igma"
      }
    },
    {
      context = {
        trig = "tau"
      }
    },
    {
      context = {
        trig = "[Uu]psilon"
      }
    },
    {
      context = {
        trig = "[Pp]hi",
        priority = 999
      }
    },
    {
      context = {
        trig = "chi"
      }
    },
    {
      context = {
        trig = "[Pp]si"
      }
    },
    {
      context = {
        trig = "[Oo]mega"
      }
    },
    {
      context = {
        trig = "varepsilon"
      }
    },
    {
      context = {
        trig = "varphi"
      }
    },
    {
      context = {
        trig = "vartheta"
      }
    },
    {
      context = {
        trig = "varkappa"
      }
    }
  },
  trigonometric = {
    {
      context = {
        trig = "sin"
      }
    },
    {
      context = {
        trig = "cos"
      }
    },
    {
      context = {
        trig = "tan"
      }
    },
    {
      context = {
        trig = "tg"
      }
    },
    {
      context = {
        trig = "cot"
      }
    },
    {
      context = {
        trig = "ctg"
      }
    },
    {
      context = {
        trig = "arcsin"
      }
    },
    {
      context = {
        trig = "arccos"
      }
    },
    {
      context = {
        trig = "arctan"
      }
    },
    {
      context = {
        trig = "arcctg"
      }
    },
    {
      context = {
        trig = "arccot"
      }
    },
    {
      context = {
        trig = "arcctg"
      }
    },
    {
      context = {
        trig = "sec"
      }
    },
    {
      context = {
        trig = "csc"
      }
    },
  },
  hyperbolic = {
    {
      context = {
        trig = "sh"
      }
    },
    {
      context = {
        trig = "cth"
      }
    },
    {
      context = {
        trig = "arsh"
      }
    },
    {
      context = {
        trig = "arch"
      }
    },
    {
      context = {
        trig = "arth"
      }
    },
    {
      context = {
        trig = "arcth"
      }
    },
  --   sinh = {
  --     context = {
  --       trig = "sinh"
  --     }
  --   },
  --   cosh = {
  --     context = {
  --       trig = "cosh"
  --     }
  --   },
  --   tanh = {
  --     context = {
  --       trig = "tanh"
  --     }
  --   },
  --   coth = {
  --     context = {
  --       trig = "coth"
  --     }
  --   },
  },
  exponential = {
    {
      context = {
        trig = "ln"
      }
    },
    {
      context = {
        trig = "log"
      }
    },
    {
      context = {
        trig = "exp"
      }
    }
  },
  relation = {
    {
      context = {
        trig = "ll",
        dscr = [[much less << (relation)]]
      }
    },
    {
      context = {
        trig = "gg",
        dscr = "much greater >> (relation)"
      }
    },
    {
      context = {
        trig = "neq",
        dscr = [[\neq != (relation)]],
      }
    },
  },
  logic = {
    {
      context = {
        trig = "to",
        dscr = [[\to -> (logic)]]
      }
    },
  },
  other = {
    {
      context = {
        trig = "nabla",
        dscr = [[\nabla]]
      }
    }
  }
}

-- args for normal snippets
M.fortips = {
  relation = {
    {
      context = {
        trig = "subset",
        dscr = [[\subset ( (relation)]]
      }
    },
    {
      context = {
        trig = "subseteq",
        dscr = [[\subseteq (= (relation)]]
      }
    },
    {
      context = {
        trig = "nsubseteq",
        dscr = [[\nsubseteq (!= (relation)]]
      }
    },
    {
      context = {
        trig = "supset",
        dscr = [[\superset ) (relation)]]
      }
    },
  },
  logic = {
    {
      context = {
        trig = "Rightarrow",
        dscr = [[\Rightarrow => (logic)]],
      }
    },
    {
      context = {
        trig = "Leftrightarrow",
        dscr = [[\Leftrightarrow <=> (logic)]]
      }
    },
  },
}

M.delimiters = {
  a = { [[\langle]], [[\rangle]]}, -- angle
	b = { [[\{]], [[\}]] }, -- braces (curly brackets)
  c = { [[\lceil]], [[\rceil]] }, -- ceil
  f = { [[\lfloor]], [[\rfloor]] }, -- floor
	m = { "|", "|" }, -- mid
  n = { [[\|]], [[\|]] }, -- norm
	p = { "(", ")" }, -- parentheses (round brackets)
	s = { "[", "]" }, -- square
}

return M
