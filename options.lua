if vim.fn.has "wsl" == 1 then
  return {
    g = {
      clipboard = {
        name = "WslClipboard",
        copy = {
           ["+"] = "clip.exe",
           ["*"] = "clip.exe",
        },
        paste = {
          ["+"] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
          ["*"] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
        },
        cache_enabled = false
      },
    },
  }
end
