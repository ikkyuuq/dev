return {
  cmd = { 'arduino-language-server' },
  filetypes = { 'arduino' },
  root_markers = { '*.ino', 'sketch.yaml', '.git' },
  capabilities = {
    textDocument = {
      semanticTokens = vim.NIL,
    },
  },
}