local astro_utils = require "astronvim.utils"


return {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- resize with arrows
    ["<S-Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<S-Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<S-Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<S-Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- buffer switching
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    -- neogen
    ["<localleader>a"] = { desc = "󰏫 Annotate" },
    ["<localleader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<localleader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<localleader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<localleader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<localleader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- trouble
    ["<localleader>x"] = { desc = "󰒡 Trouble" },
    ["<localleader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    ["<localleader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    ["<localleader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
    ["<localleader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    ["<localleader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
    -- spectre
    ["<localleader>s"] = { desc = "󰛔 Search/Replace" },
    ["<localleader>ss"] = { function() require("spectre").toggle() end, desc = "Toggle Spectre" },
    ["<localleader>sf"] = { function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
    ["<localleader>sw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },
    -- luasnip
    ["<localleader>l"] = { desc = " LuaSnip", },
    ["<localleader>le"] = {
      function() require("luasnip.loaders").edit_snippet_files {} end,
      desc = "Edit snipppets"
    },
    ["<localleader>lo"] = {
      function() require("luasnip.extras.snippet_list").open() end,
      desc = "Open snippet list"
    },
  },
  v = {
    ["<leader>s"] = { function() require("spectre").open_visual() end, desc = "Spectre" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
  },
  -- terminal mappings
  t = {
    ["<esc><esc>"] = { "<C-\\><C-n>", desc = "Terminal quit" },
  },
}
