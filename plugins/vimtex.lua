local config = function()
  vim.g.vimtex_quickfix_enabled = 0
  -- Open pdfviwer on compile
  -- vim.g.vimtex_view_automatic = 1
  vim.g.vimtex_syntax_enabled = 0

  -- Check the operating system and set platform-specific configurations
  if vim.fn.has("win64") == 1 then
    -- Windows-specific configuration
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
  else
    -- macOS and Unix-specific configuration
    -- Add any platform-specific settings here
  end
end

return {
  'lervag/vimtex',
  ft = { 'tex', 'bib' },
  config = config,
}
