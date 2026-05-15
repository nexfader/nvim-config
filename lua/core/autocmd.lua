local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end,
})

autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    local keymap = vim.keymap.set
    local opts = { remap = false, silent = true }
    keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Describe symbol', unpack(opts) })
    keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', unpack(opts) })
    keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', unpack(opts) })
    keymap('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation', unpack(opts) })
    keymap('n', 'gr', vim.lsp.buf.references, { desc = 'View references', unpack(opts) })
    keymap('n', '<Leader>lh', vim.lsp.buf.signature_help, { desc = 'Display signature help', unpack(opts) })
    keymap('n', '<Leader>lt', vim.lsp.buf.type_definition, { desc = 'Display type definition', unpack(opts) })
    keymap('n', '<Leader>lr', vim.lsp.buf.rename, { desc = 'Rename', unpack(opts) })
    keymap('n', '<Leader>la', vim.lsp.buf.code_action, { desc = 'Code actions', unpack(opts) })
    keymap('n', '<Leader>ld', vim.diagnostic.open_float, { desc = 'Display diagnostic info', unpack(opts) })
    keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic', unpack(opts) })
    keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic', unpack(opts) })
  end
})
