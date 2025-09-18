return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
        typeCheckingMode = 'basic',
        -- Better for libraries like OpenCV
        stubPath = vim.fn.stdpath('data') .. '/lazy/python-type-stubs/stubs',
        -- Include common scientific computing packages
        extraPaths = {},
      }
    }
  }
}