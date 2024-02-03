local config = function()
  vim.g.vimtex_quickfix_enabled = 0
  -- Open pdfviwer on compile
  -- vim.g.vimtex_view_automatic = 1

  -- Check the operating system and set platform-specific configurations
  if vim.fn.has("win32") == 1 then
    -- Windows-specific configuration
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
  elseif vim.fn.has("mac") == 1 or vim.fn.has("unix") == 1 then
    -- macOS and Unix-specific configuration
    -- Add any platform-specific settings here
  end
end

return {
  'lervag/vimtex',
  ft = { 'tex', 'bib' },
  config = config,
}
