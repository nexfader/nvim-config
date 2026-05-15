return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    init = function()
      local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"
      vim.opt.runtimepath:prepend(lspConfigPath)
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require('conform')
      local js_formatter = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true }
      conform.setup({
        formatters = {
          csharpier = {
            command = "csharpier",
            args = { "format", "--write-stdout" },
          }
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          rust = { 'rustfmt', lsp_format = 'fallback' },
          javascript = js_formatter,
          typescript = js_formatter,
          vue = js_formatter,
          cs = { 'csharpier' },
        },
        format_on_save = {
          timeout_ms = 2500,
        },
      })

      vim.keymap.set('n', '<Leader>lf', function()
        conform.format({ async = true, bufnr = bufnr })
      end, { desc = 'Format document' })
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'vale' },
        typescript = { 'eslint_d' },
        javascript = { 'eslint_d' },
        vue = { 'eslint_d' },
      }
    end,
  },
}
