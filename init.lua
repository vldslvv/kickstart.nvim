H = require 'helpers'

-- Define custom vars

-- Set true if have copilot license
local have_copilot = false

-- Set to true if you have a Nerd Font installed and selected in the terminal
local have_nerd_font = true

require 'options'
require 'keymaps'
require 'autocommands'

-- Apply this later so it may overwrite some already defined settings
-- NOTE: cannot name module vscode.lua is it conflicts with the VSCode extenstion
-- NOTE: neovide is prefixed with `custom-` to keep consistency
H.if_condition_require(vim.g.vscode, 'custom-vscode')
H.if_condition_require(vim.g.neovide, 'custom-neovide')

-- Apply plugins as last stage
local plugins = require 'plugins'
plugins.setup(vim.g.vscode, have_copilot, have_nerd_font)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
