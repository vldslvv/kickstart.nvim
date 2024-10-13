-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

local pluginList = {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'plugins.lualine',
  require 'plugins.gitsigns',
  require 'plugins.telescope',
  require 'plugins.which-key',
  require 'plugins.nvim-treesitter',
  require 'plugins.nvim-surround',
  require 'plugins.plenary',
  require 'plugins.neo-tree',
  require 'plugins.catpuccin',
  require 'plugins.dashboard-nvim',
  require 'plugins.neogit',
  (vim.g.vscode and {} or require 'lsp'),

  -- require 'plugins.debug',
  -- require 'plugins.indent_line',
  -- require 'plugins.lint',
  -- require 'plugins.autopairs',
}

local uiMap = {
  -- If you are using a Nerd Font: set icons to an empty table which will use the
  -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  icons = vim.g.have_nerd_font and {} or {
    cmd = '⌘',
    config = '🛠',
    event = '📅',
    ft = '📂',
    init = '⚙',
    keys = '🗝',
    plugin = '🔌',
    runtime = '💻',
    require = '🌙',
    source = '📄',
    start = '🚀',
    task = '📌',
    lazy = '💤 ',
  },
}

require('lazy').setup(pluginList, { ui = uiMap })
