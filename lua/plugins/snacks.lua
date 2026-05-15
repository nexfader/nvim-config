return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = {
      enabled = true,
    },
    input = { enabled = true },
    notifier = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
      layout = {
        backdrop = false,
        width = 40,
        min_width = 40,
        height = 0,
        position = "left",
        border = "none",
        box = "vertical",
        { win = "list", border = "none" },
        { win = "preview", title = "{preview}", height = 0.4, border = "top" },
      },
    },
    picker = {
      enabled = true,
      layout = {
        preset = 'ivy_split'
      },
    },
  },
  keys = {
    { "<leader><leader>", function() Snacks.picker.resume() end, desc = "Resume last picker" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Show recent files" },

    { "<leader>e", function() Snacks.explorer.open() end, desc = "Open file explorer" },

    { "<leader>gb", function() Snacks.gitbrowse({ what = 'file' }) end, desc = "Open the file in the browser", mode = { 'n', 'v' } },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gB", function() Snacks.gitbrowse({ what = 'permalink' }) end, desc = "Open the permanent file in the browser", mode = { 'n', 'v' } },

    { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
