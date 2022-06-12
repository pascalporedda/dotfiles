local util = require('lzrvim.utils')

vim.g.lzrvim_is_qf_l = 0
vim.g.lzrvim_is_qf_g = 0

util.create_augroup({
  {
    'USER',
    'LspDiagnosticsChanged',
    ':lua',
    'vim.lsp.diagnostic.set_loclist({ open_loclist = false })'
  }
}, 'locallist')

local M = {}

function M.toggle_qf_list(global_list)
  if global_list then
    if vim.g.lzrvim_is_qf_g == 1 then
      vim.cmd('cclose')
    else
      vim.cmd('copen')
    end
  else
    if vim.g.lzrvim_is_qf_l == 1 then
      vim.cmd('lclose')
    else
      vim.cmd('lopen')
    end
  end
end

function M.toggle_qf_control_variable(is_leaving)
  local control_value = not is_leaving and 1 or 0
  local current_win_id = vim.api.nvim_get_current_win()
  local win_info = vim.fn.getwininfo(current_win_id)
  if not win_info then 
    return 
  end
  local win = win_info[0] ~= nil and win_info[0] or win_info[1]

  if win.loclist == 1 then
    vim.g.lzrvim_is_qf_l = control_value
  else
    vim.g.lzrvim_is_qf_g = control_value
  end

  return win  
end

util.create_augroup({
  {
    'BufWinEnter',
    'quickfix',
    ':lua require("lzrvim.quickfix").toggle_qf_control_variable()'
  },
  {
    'BufWinLeave',
    '*',
    ':lua require("lzrvim.quickfix").toggle_qf_control_variable(true)'
  }
}, 'qfcontrol')

return M
