local M = {}

function M.detect_venv_python()
  local cwd = vim.fn.getcwd()
  local patterns = { "venv", ".venv", "env", ".env", "virtualenv" }

  for _, pattern in ipairs(patterns) do
    local venv_path = cwd .. "/" .. pattern
    if vim.fn.isdirectory(venv_path) == 1 then
      local python_path = venv_path .. "/bin/python"
      if vim.fn.filereadable(python_path) == 1 then
        return python_path
      end
    end
  end
  return nil
end

function M.setup_venv()
  local venv_python = M.detect_venv_python()
  if venv_python then
    vim.g.python3_host_prog = venv_python
    vim.cmd("let $VIRTUAL_ENV = '" .. venv_python:gsub("/bin/python", "") .. "'")
    print("Using venv: " .. venv_python)
  end
end

return M
