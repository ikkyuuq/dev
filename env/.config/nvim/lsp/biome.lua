return {
  cmd = { 'biome', 'lsp-proxy' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'json', 'jsonc' },
  root_markers = { 'biome.json', 'biome.jsonc', 'package.json', '.git' },
  single_file_support = false,
}