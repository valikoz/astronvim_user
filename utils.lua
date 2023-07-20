local M = {}

---@param {cmd} table
---@param {opts} is a table with these keys:
  -- title: (string or nil) Notification's title.
  -- on_finish: (function, default=nil) Attach to on_exit.
function M.async_run(cmd, opts)

  local function on_event(_, data, event)
    if #data ~= 1 then
      vim.schedule(function() 
        vim.notify(table.concat(data):gsub("\r", "\n"), 
          -- Log level 2 -> INFO, 4 -> ERROR.
          (event == "stdout" and 2) or 4,
          {title = opts.title}
        ) 
      end)
    end
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_event,
    on_stderr = on_event,
    on_exit = opts.on_finish,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists then
    vim.cmd.cclose()
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  end
end

return M
