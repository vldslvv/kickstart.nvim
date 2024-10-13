local M = {}

function M.if_condition_require(condition, module_name)
  return condition and require(module_name) or {}
end

return M
