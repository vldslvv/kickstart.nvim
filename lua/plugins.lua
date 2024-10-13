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
H = require 'helpers'

local M = {}

function M.setup(is_vscode, have_copilot, have_nerd_font)
  local pluginList = {
    require 'plugins.vim-sleuth',
    H.if_condition_require(not is_vscode, 'plugins.lualine'),
    H.if_condition_require(not is_vscode, 'plugins.gitsigns'),
    H.if_condition_require(not is_vscode, 'plugins.telescope'),
    H.if_condition_require(not is_vscode, 'plugins.which-key'),
    require 'plugins.nvim-treesitter',
    require 'plugins.nvim-surround',
    require 'plugins.plenary',
    H.if_condition_require(not is_vscode, 'plugins.neo-tree'),
    H.if_condition_require(not is_vscode, 'plugins.catpuccin'),
    H.if_condition_require(not is_vscode, 'plugins.dashboard-nvim'),
    H.if_condition_require(not is_vscode, 'plugins.neogit'),
    H.if_condition_require(not is_vscode, 'lsp'),
    H.if_condition_require(not is_vscode and have_copilot, 'plugins.copilot'),
    H.if_condition_require(not is_vscode and have_copilot, 'plugins.copilot-chat'),

    -- require 'plugins.debug',
    -- require 'plugins.indent_line',
    -- require 'plugins.lint',
    -- require 'plugins.autopairs',
  }

  local uiMap = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = have_nerd_font and {} or {
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

  return require('lazy').setup(pluginList, { ui = uiMap })
end

return M
