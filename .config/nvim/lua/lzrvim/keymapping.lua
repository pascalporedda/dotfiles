local map = vim.api.nvim_set_keymap

local M = {}

function M.create_remap(type, opts)
    return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
        opts = opts or { noremap = false }
        map(type, lhs, rhs, opts)
    end
end

M.v_noremap = M.create_remap("v", {noremap = true})
M.n_noremap = M.create_remap("n", {noremap = true})
M.i_noremap = M.create_remap("i", {noremap = true})
M.t_noremap = M.create_remap("t", {noremap = true})
M.o_noremap = M.create_remap("o", {noremap = true})

M.i_remap   = M.create_remap("i")
M.n_remap   = M.create_remap("n")
M.v_remap   = M.create_remap("v")
M.t_remap   = M.create_remap("t")
M.o_remap   = M.create_remap("o")


-- Use space as the leader key
M.n_remap('<Space>', '')
vim.g.mapleader = ' '

-- LspSaga mappings (code actions)

-- M.n_noremap("<silent>K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")

-- Telescope mappings
M.n_noremap("<leader>pf",
         "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
M.n_noremap("<C-p>",
         "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>")
M.n_noremap("<Leader>ff",
         "<cmd>lua require('telescope.builtin').find_files({ hidden = true  })<CR>")
M.n_noremap("<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")

-- Other remaps

M.i_noremap("jk", "<Esc>")
M.i_noremap("kj", "<Esc>")
M.n_noremap("<leader>=", ":Neoformat<CR>")

-- NVIM Tree
--
M.n_noremap("<leader>tt", "<cmd>lua require\"nvim-tree\".toggle(false, true)<CR>")
M.n_noremap("<leader>tr", ":NvimTreeRefresh<CR>")
M.n_noremap("<leader>tf", ":NvimTreeFindFile<CR>")

-- Git fugitive

M.n_noremap("<leader>gb", ":Git blame<CR>")
M.n_noremap("<leader>gd", ":Git vdiff<CR>")
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

return M
