local runtime_path = vim.split(package.path, ';')
local cmp = require 'cmp'
local luasnip = require("luasnip")
local key_mapper = require 'lzrvim.keymapping'
local lspconfig = require('lspconfig')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

local function tab(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        -- F("<Tab>")
        fallback()
    end
end

local function shtab(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        -- F('<S-Tab>')
        fallback()
    end
end

local function enterit(fallback)
    if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false})
    else
        -- F("<CR>")
        fallback()
    end
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<Tab>'] = cmp.mapping(tab, {'i', 's', 'c'}),
        ['<S-Tab>'] = cmp.mapping(shtab, {'i', 's', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if ou want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping(enterit, {"i", "s"})
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'luasnip'} -- For luasnip users.
    }, {{name = 'buffer'}})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

local function lsp_config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp
                                                                       .protocol
                                                                       .make_client_capabilities()),
        on_attach = function()
            key_mapper.n_noremap("gd", ":lua vim.lsp.buf.definition()<CR>")
            key_mapper.n_noremap("K", ":lua vim.lsp.buf.hover()<CR>")
            -- key_mapper.n_noremap("<silent><leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
            -- key_mapper.v_noremap("<silent><leader>ca", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")

            key_mapper.n_noremap("<leader>vws",
                                 ":lua vim.lsp.buf.workspace_symbol()<CR>")
            key_mapper.n_noremap("<leader>vd",
                                 ":lua vim.diagnostic.open_float()<CR>")
            key_mapper.n_noremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
            key_mapper.n_noremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
            key_mapper.n_noremap("<leader>ca",
                                 ":lua vim.lsp.buf.code_action()<CR>")
            key_mapper.n_noremap("<leader>cr",
                                 ":lua vim.lsp.buf.references()<CR>")
            key_mapper.n_noremap("<leader>rr", ":lua vim.lsp.buf.rename()<CR>")
            key_mapper.i_noremap("<C-p>",
                                 "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        end
    }, _config or {})
end

-- Setup lspconfig.
lspconfig.tsserver.setup(lsp_config())
lspconfig.html.setup(lsp_config())
lspconfig.cssls.setup(lsp_config())
lspconfig.jsonls.setup(lsp_config())
lspconfig.tailwindcss.setup(lsp_config())
lspconfig.rust_analyzer.setup(lsp_config())
lspconfig.prismals.setup(lsp_config())
lspconfig.terraformls.setup(lsp_config())
vim.cmd [[autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()]]

lspconfig.gopls.setup(lsp_config())
lspconfig.sumneko_lua.setup(lsp_config({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}))

lspconfig.graphql.setup(lsp_config())
lspconfig.dockerls.setup(lsp_config())
lspconfig.eslint.setup(lsp_config())
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]

