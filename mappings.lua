local utils = require "user.utils"
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
      --- require
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
    ["<leader>a"] = { desc = "󰏫 Annotate" },
    ["<leader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- spectre
    ["<leader>s"] = { desc = "󰛔 Search/Replace" },
    ["<leader>ss"] = { function() require("spectre").toggle() end, desc = "Toggle Spectre" },
    ["<leader>sf"] = { function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
    ["<leader>sw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },
    -- trouble
    ["<leader>x"] = { desc = "󰒡 Trouble" },
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    ["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
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
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },
}
