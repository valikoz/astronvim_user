return {
  'lervag/vimtex',
  enabled = vim.fn.has "unix" == 0,
  ft = { 'tex', 'bib' },
  config = function()
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    -- Open pdfviwer on compile
    vim.g.vimtex_view_automatic = 1
  end
}
