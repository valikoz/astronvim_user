local utils = require "user.utils"

-- commands
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


-- globals
P = function(v)
  print(vim.inspect(v))
  return v
end

-- keymaps
--- TODO: move this mappings into user/mappings.lua
if not pcall(require, "luasnip") then
  return
end
vim.keymap.set({ 'i', 's' }, '<c-n>', function()
   if require("luasnip").expand_or_jumpable() then
    require("luasnip").expand_or_jump()
   else
    return nil
   end
end, { desc = "Jump to next node", silent = true })

vim.keymap.set({ 'i', 's' }, '<c-p>', function()
  if require("luasnip").jumpable() then
    require("luasnip").jump(-1)
  else
    return false
  end
end, { desc = "Jump to previous node", silent = true })

vim.keymap.set({ "i", "s" }, "<c-x>", function()
  if require("luasnip").in_snippet() then
    utils.untrigger()
    require("luasnip").unlink_current()
  end
end, {
  desc = "Undo a snippet right after triggering it",
  silent = true
})
