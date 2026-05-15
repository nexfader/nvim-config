vim.loader.enable()
require('core')

vim.lsp.enable({
  'rust_analyzer',
  'lua_ls',
  'roslyn_ls',
  'vue_ls',
  'vtsls',
  'graphql',
  'pyright',
})
