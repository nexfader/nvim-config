local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = os.getenv('VUE_TS_PLUGIN_PATH'),
  languages = { 'vue' },
  configNamespace = 'typescript',
}
return {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
