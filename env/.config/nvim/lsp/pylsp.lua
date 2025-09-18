return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },  -- Disable if you don't want style warnings
        mccabe = { enabled = false },
        pyflakes = { enabled = true },
        pylint = { enabled = false },  -- Can be enabled if you want it
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- Jedi settings for better completion
        jedi_completion = { 
          enabled = true,
          include_params = true,
          include_class_objects = true,
          fuzzy = true
        },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = true },
        jedi_symbols = { enabled = true },
      }
    }
  },
}
