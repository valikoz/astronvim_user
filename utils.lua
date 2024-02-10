local M = {}


---@param cmd table
---@param opts table is a table with these keys:
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


return M
