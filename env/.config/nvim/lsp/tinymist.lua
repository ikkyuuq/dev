return {
  -- Command and arguments to start the server.
  cmd = { 'tinymist' },

  -- Filetypes to automatically attach to.
  filetypes = { 'typst' },

  -- Sets the "root directory" to the parent directory containing a Typst project
  root_markers = { '*.typ', '.git' },

  -- Server settings for typst-lsp
  settings = {
    exportPdf = "onSave"  -- Export PDF on type, can be "onSave", "onType", or "never"
  }
}
