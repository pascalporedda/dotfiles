local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = {
        "lua", "javascript", "typescript", "css", "html", "prisma", "graphql",
        "rust", "yaml", "hcl", "tsx"
    },
    highlight = {enable = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true}
}
