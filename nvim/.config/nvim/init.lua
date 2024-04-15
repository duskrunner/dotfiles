require 'config'

require('lazy').setup({
  require 'plugins.nvim-lspconfig',
  'tpope/vim-sleuth',
  require 'plugins.persistence',
  require 'plugins.dashboard-nvim',
  require 'plugins.dressing',
  require 'plugins.noice',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.nvim-spectre',
  require 'plugins.indent-blankline',
  require 'plugins.mini.indentscope',
  require 'plugins.neo-tree',
  require 'plugins.flash',
  require 'plugins.which-key',
  require 'plugins.gitsigns',
  require 'plugins.telescope',
  require 'plugins.vim-illuminate',
  require 'plugins.trouble',
  require 'plugins.todo-comments',
  require 'plugins.vim-startuptime',
  require 'plugins.nvim-lint',
  require 'plugins.mini.pairs',
  require 'plugins.mini.surround',
  require 'plugins.Comment_nvim',
  require 'plugins.conform',
  require 'plugins.LuaSnip',
  require 'plugins.nvim-treesitter',
  require 'plugins.nvim-treesitter-context',
  require 'plugins.diffview',
  require 'plugins.doge',
  require 'plugins.nvim-ts-autotag',
  require 'plugins.nvim-cmp',
  require 'plugins.toggleterm',
  require 'plugins.markdown-preview',
  require 'plugins.icon-picker',
  require 'plugins.transparent',
  require 'plugins.nvim-dap',
  require 'plugins.venv-select',
  unpack(require 'config.colorschemes'),
}, { checker = { enabled = true, notify = true }, change_detection = { notify = true, enabled = true } })

require 'config.dap'
