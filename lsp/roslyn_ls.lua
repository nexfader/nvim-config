return {
  cmd = {
    'Microsoft.CodeAnalysis.LanguageServer.exe',
    '--logLevel',
    'Information',
    '--extensionLogDirectory',
    vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
    '--stdio',
  },
}
