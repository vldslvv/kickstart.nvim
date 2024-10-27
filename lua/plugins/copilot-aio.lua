-- AIO for copilot plugins

local M = {}

local github_copilot = { -- TODO: auto run :Copilot setup on install
  -- TODO: check this
  -- https://github.com/github/copilot.vim/blob/49e0348bfb913fae63ca5ddb987a8bccd193da86/doc/copilot.txt#L146
  'github/copilot.vim',
}

-- TODO: doesn't work yet
local copilot_custom = {
  -- 'zbirenbaum/copilot.lua',
  -- cmd = 'Copilot',
  -- event = 'InsertEnter',
  -- config = function()
  --   require('copilot').setup {}
  -- end,
}

local function get_copilot_chat_config(use_github_copilot_plugin)
  local copilot_dependency = use_github_copilot_plugin and 'github/copilot.vim' or 'zbirenbaum/copilot.lua'

  local copilot_chat = {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { copilot_dependency },
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  }

  return copilot_chat
end

-- TODO: refactor, use one method and find a way to flatten a table
function M.setup_copilot(use_github_copilot_plugin)
  if use_github_copilot_plugin then
    return github_copilot
  else
    return copilot_custom
  end
end

-- TODO: useless, get rid of pass-through function and input param
function M.setup_copilot_chat(use_github_copilot_plugin)
  return get_copilot_chat_config(use_github_copilot_plugin)
end

return M
