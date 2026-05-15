return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
      { "<leader>d", function() require('dap').toggle_breakpoint() end },
      { "<leader>c", function() require('dap').continue() end },
    }
  },
  {
    "igorlfs/nvim-dap-view",
    opts = {},
    dependencies = { "mfussenegger/nvim-dap" },
    config = function ()
      local dap = require('dap')
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { os.getenv('JS_DEBUG_SERVER_PATH'), "${port}" },
        }
      }

      local languages = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'vue' }
      for _, language in ipairs(languages) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to Node app',
            address = 'localhost',
            port = 9229,
            cwd = '${workspaceFolder}',
            restart = true,
          },
        }
      end
    end,
  },
}
