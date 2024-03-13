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


-- autocmd
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Make q close floats",
  group = vim.api.nvim_create_augroup("q_close_windows", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    local is_modified = vim.api.nvim_get_option_value("modified", { buf = args.buf })
    local is_buffer = vim.tbl_contains({ "terminal", "help", "quickfix", "nofile", }, buftype)
    if is_buffer or is_modified and vim.fn.maparg("q", "n") == "" then
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        desc = "Close window",
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})


-- globals
P = function(v)
  print(vim.inspect(v))
  return v
end
