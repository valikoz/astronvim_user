return {
  settings = {
    texlab = {
      build = { onSave = false },
      forwardSearch = { executable = "sioyek", args = {
        "--reuse-window",
        "--execute-command",
        "toggle_synctex",
        "--forward-search-file",
        "%f",
        "--forward-search-line",
        "%l",
        "%p",
      } },
    },
  },
}
