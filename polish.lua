local utils = require "user.utils"

-- Remove extra characters
vim.api.nvim_create_user_command("ClearWhitespaces", function()
  local save_cursor = vim.fn.getpos "."
  vim.cmd [[%s/\s\+$//e|nohlsearch]]
  vim.fn.setpos(".", save_cursor)
end, { desc = "Clearing whitespaces" })
vim.api.nvim_create_user_command("ClearCRLF", function()
  local save_cursor = vim.fn.getpos "."
  vim.cmd [[%s/\r\+$//e|nohlsearch]]
  vim.fn.setpos(".", save_cursor)
end, { desc = "Clearing carriages" })
-- Execute python files
vim.api.nvim_create_user_command("ExecutePy", function()
  local filename = vim.fn.expand "%:t"
  if vim.bo.filetype == "python" then
    vim.cmd "silent! write"
    utils.async_run({ "python3", vim.fn.expand "%:p" }, {
      title = "Execute " .. filename,
    })
  else
    vim.notify("Cannot execute " .. filename, 3, { title = "Warning" })
    return nil
  end
end, { bang = true, desc = "Execute python file" })
-- Copy content from unnamed register " to clipboard
vim.api.nvim_create_user_command("CopyToClipboard", function()
  -- Get the contents of the " register
  local register_content = vim.fn.getreg '"'

  -- Escape special characters in the register content
  local escaped_content = vim.fn.shellescape(register_content)

  local command = nil

  if vim.fn.has "win64" then
    -- Construct the command to copy to clipboard using clip.exe
    command = string.format("echo %s | clip.exe", escaped_content)
  elseif vim.fn.has "macos" then
    command = string.format("echo %s | pbcopy", escaped_content)
  end

  -- Execute the command
  local success = os.execute(command)

  if not success then print "Error: Unable to copy to clipboard." end
end, { bang = true, desc = "Copy content to clipboard" })
-- create an augroup to easily manage autocommands
-- vim.api.nvim_create_augroup("autohidetabline", { clear = true })
-- create a new autocmd on the "User" event
-- vim.api.nvim_create_autocmd("User", {
--   desc = "Hide tabline when only one buffer and one tab", -- nice description
--   -- triggered when vim.t.bufs is updated
--   pattern = "AstroBufsUpdated", -- the pattern si the name of our User autocommand events
--   group = "autohidetabline", -- add the autocmd to the newly created augroup
--   callback = function()
--     -- if there is more than one buffer in the tab, show the tabline
--     -- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
--     local new_showtabline = #vim.t.bufs > 1 and 2 or 1
--     -- check if the new value is the same as the current value
--     if new_showtabline ~= vim.opt.showtabline:get() then
--       -- if it is different, then set the new `showtabline` value
--       vim.opt.showtabline = new_showtabline
--     end
--   end,
-- })
