local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}}
    },
    pickers = {
        oldfiles = {theme = "dropdown"},
        lsp_references = {theme = "dropdown"},
        lsp_definitions = {theme = "dropdown"},
        lsp_workspace_symbols = {theme = "dropdown"},
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor {
                -- even more opts
            }
        },
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                }
            }
        }
    }
})

vim.g.git_worktree_log_level = 'error'

require("git-worktree").setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "NvimTreeOpen",
    clearjumps_on_change = true,
    autopush = false
})

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension('harpoon')
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")

local M = {}

function M.reload_modules()
    -- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
    -- awesome things.
    local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
    for _, dir in ipairs(lua_dirs) do
        dir = string.gsub(dir, "./lua/", "")
        require("plenary.reload").reload_module(dir)
    end
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true
    })
end

local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
                        prompt_bufnr)
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M.refactors = function()
    require("telescope.pickers").new({}, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors()
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end
    }):find()
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end
    })
end

return M
