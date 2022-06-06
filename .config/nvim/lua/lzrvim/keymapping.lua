local map = vim.api.nvim_set_keymap

local M = {}

function M.create_remap(type, opts)
    return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
        opts = opts or {noremap = false}
        map(type, lhs, rhs, opts)
    end
end

M.v_noremap = M.create_remap("v", {noremap = true})
M.n_noremap = M.create_remap("n", {noremap = true})
M.i_noremap = M.create_remap("i", {noremap = true})
M.t_noremap = M.create_remap("t", {noremap = true})
M.o_noremap = M.create_remap("o", {noremap = true})

M.i_remap = M.create_remap("i")
M.n_remap = M.create_remap("n")
M.v_remap = M.create_remap("v")
M.t_remap = M.create_remap("t")
M.o_remap = M.create_remap("o")

M.n_noremap_silent = M.create_remap("n", {noremap = true, silent = true})
M.v_noremap_silent = M.create_remap("v", {noremap = true, silent = true})

-- Use space as the leader key
M.n_remap('<Space>', '')
vim.g.mapleader = ' '

-- Telescope mappings
M.n_noremap("<leader>ps",
            "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
M.n_noremap("<leader>pw",
            "<cmd>lua require('telescope.builtin').grep_string{ search = vim.fn.expand('<cword>') }<CR>")
M.n_noremap("<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
M.n_noremap("<Leader>pf",
            "<cmd>lua require('telescope.builtin').find_files({ hidden = true  })<CR>")
-- nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
M.n_noremap("<leader>vh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
M.n_noremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")

-- Git worktree mappings
M.n_noremap('<leader>gw',
            '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
M.n_noremap('<leader>gm',
            '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

-- Harpoon mappings

M.n_noremap_silent('<leader>a', '<cmd>lua require("harpoon.mark").add_file()<CR>')
M.n_noremap_silent('<C-e>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
M.n_noremap_silent('<leader>e', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
M.n_noremap_silent('<leader><leader>a', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>')
M.n_noremap_silent('<leader><leader>s', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>')
M.n_noremap_silent('<leader><leader>d', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>')
M.n_noremap_silent('<leader><leader>f', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>')

-- Other remaps

M.i_noremap("jk", "<Esc>")
M.i_noremap("kj", "<Esc>")
M.n_noremap_silent("<leader>=", ":Neoformat<CR>")
M.n_noremap_silent("<leader>/", ":Rg ")

-- NVIM Tree
--
M.n_noremap("<leader>tt",
            "<cmd>lua require\"nvim-tree\".toggle(false, true)<CR>")
M.n_noremap("<leader>tr", ":NvimTreeRefresh<CR>")
M.n_noremap("<leader>tf", ":NvimTreeFindFile<CR>")

-- Git fugitive and other git commands

M.n_noremap("<leader>gb", ":Git blame<CR>")
M.n_noremap("<leader>gd", ":Git diff<CR>")
M.n_noremap("<leader>gs", ":Git<CR>")
M.n_noremap("<leader>gp", ":Git push<CR>")
M.n_noremap("<leader>gdh", ":diffget //3<CR>")
M.n_noremap("<leader>gdl", ":diffget //2<CR>")
M.n_noremap("<leader>gfh", ":Glog -- %<CR>")


-- Window navigation

M.n_noremap("<C-j>", "<C-W><C-j>")
M.n_noremap("<C-k>", "<C-W><C-k>")
M.n_noremap("<C-l>", "<C-W><C-l>")
M.n_noremap("<C-h>", "<C-W><C-h>")

-- Use esc in terminal mode 
M.t_noremap("<Esc>", "<C-\\><C-n>")

-- Key bindings for hop, a quick and easy way to navigate in files by pattern search
M.n_noremap('<leader>s', "<cmd> lua require'hop'.hint_patterns()<cr>")
M.v_noremap('<leader>s', "<cmd> lua require'hop'.hint_patterns()<cr>")
M.o_noremap('<leader>s', "<cmd> lua require'hop'.hint_patterns()<cr>")

-- Quickfix navigation

M.n_noremap('<leader>q', '<cmd>:')
M.n_noremap('<leader>k', '<cmd>cprev<CR>zz')
M.n_noremap('<leader>j', '<cmd>cnext<CR>zz')
M.n_noremap('<leader><leader>k', '<cmd>lprev<CR>zz')
M.n_noremap('<leader><leader>j', '<cmd>lnext<CR>zz')
M.n_noremap('<C-q>', '<cmd>call ToggleQFList(1)<CR>')
M.n_noremap('<leader>q', '<cmd>call ToggleQFList(0)<CR>')

return M
