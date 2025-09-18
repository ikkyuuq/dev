vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Function to detect conda environment
local function setup_python_path()
  local conda_prefix = os.getenv("CONDA_PREFIX")
  if conda_prefix then
    vim.g.python3_host_prog = conda_prefix .. "/bin/python"
    -- Set the path for LSP to find packages
    local python_path = conda_prefix .. "/lib/python*/site-packages"
    vim.env.PYTHONPATH = python_path .. ":" .. (vim.env.PYTHONPATH or "")
  end
end

-- Call this function when Neovim starts
setup_python_path()
