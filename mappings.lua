local utils = require "user.utils"
return {
  n = {
    ["<leader>mp"] = {
      function()
        local filename = vim.fn.expand "%:t"
        if vim.bo.filetype == "python" then
          vim.cmd "silent! write"
          utils.async_run({ "python", vim.fn.expand "%:p" }, { title = "Execute " .. filename })
        else
          vim.notify("Cannot execute " .. filename, 3, { title = "Warning" } )
          return nil
        end
      end,
      desc = "Execute python file",
    },
    ["<leader>ml"] = {
      function()
        local filename = vim.fn.expand "%:t"
        if vim.bo.filetype == "lua" then
          vim.cmd "silent! write"
          utils.async_run({ "lua", vim.fn.expand "%:p" }, { title = "Execute " .. filename })
        else
          vim.notify("Cannot execute " .. filename, 3, { title = "Warning" } )
          return nil
        end
      end,
      desc = "Execute lua file",
    },
  },
}
