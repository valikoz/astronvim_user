local utils = require "user.utils"
return {
  n = { 
    ["<leader>mp"] = {
      function()
        if vim.bo.filetype == "python" then
          vim.cmd "silent! write"
          local filename = vim.fn.expand "%:t"
          utils.async_run({ "python", vim.fn.expand "%:p" }, { title = "Execute " .. filename })
        else
          return nil
        end
      end,
      desc = "Execute python file",
    },
  },
}
