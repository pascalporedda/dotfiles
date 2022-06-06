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

vim.cmd[[
fun! ToggleQFList(global)
    if a:global
        if g:lzrvim_is_qf_g == 1
            cclose
        else
            copen
        end
    else
        if g:lzrvim_is_qf_l == 1
            lclose
        else
            lopen
        end
    endif
endfun

fun! SetQFControlVariable()
    if getwininfo(win_getid())[0]['loclist'] == 1
        let g:lzrvim_is_qf_l = 1
    else
        let g:lzrvim_is_qf_g = 1
    end
endfun

fun! UnsetQFControlVariable()
    if getwininfo(win_getid())[0]['loclist'] == 1
        let g:lzrvim_is_qf_l = 0
    else
        let g:lzrvim_is_qf_g = 0
    end
endfun
]]

util.create_augroup({
  {
    'BufWinEnter',
    'quickfix',
    'call',
    'SetQFControlVariable()'
  },
  {
    'BufWinLeave',
    '*',
    'call',
    'UnsetQFControlVariable()'
  }
}, 'qfcontrol')
