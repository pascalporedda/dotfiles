-- local lint = require('lint')
-- local util = require('lzrvim.utils')

-- lint.linters_by_ft = {
--     markdown = {'vale'},
--     typescript = {'eslint'},
--     javascript = {'eslint'},
-- }

-- print('called')
-- -- util.create_augroup({
-- --   { 'BufWritePost,TextChanged', '<buffer>', 'lua require"lint".try_lint()' }
-- -- }, 'linting')

-- vim.cmd[[au BufWritePost,TextChanged <buffer> lua require('lint').try_lint()]]
