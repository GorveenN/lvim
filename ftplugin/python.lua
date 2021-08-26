lvim.lang.python.formatters = {
  { exe = "black", args = { "--fast" } },
  { exe = "isort", args = { "--profile", "black" } },
}

lvim.lang.python.linters = {
  {
    exe = "flake8",
    -- args = {}
  },
}

if lvim.builtin.dap.active then
  local dap_install = require "dap-install"
  dap_install.config("python_dbg", {})

  local dap = require "dap"
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        return "/usr/bin/python"
      end,
    },
  }
end
