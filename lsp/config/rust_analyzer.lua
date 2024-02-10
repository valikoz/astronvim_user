return {
  cmd = {
    "rustup", "run", "stable", "rust-analyzer",
  },
  flags = {
    debounce_text_changes = 150,
  },
}
