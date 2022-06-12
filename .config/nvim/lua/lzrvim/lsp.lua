local runtime_path = vim.split(package.path, ';')
local cmp = require 'cmp'
local luasnip = require("luasnip")
local key_mapper = require 'lzrvim.keymapping'
local lspconfig = require('lspconfig')
local saga = require('lspsaga')
local lspkind = require('lspkind')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

saga.init_lsp_saga()

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
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end
  },
  -- Add some nice icons to the completions like in IntelliJ / vscode
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function(_, vim_item) return vim_item end
    })
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
    {name = 'nvim_lsp'},
    {name = 'luasnip'}
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
      -- key_mapper.n_noremap_silent("<leader>rr", ":lua vim.lsp.buf.rename()<CR>")
      -- key_mapper.n_noremap_silent("K", ":lua vim.lsp.buf.hover()<CR>")
      -- key_mapper.n_noremap_silent("<leader>ca",
      --                      ":lua vim.lsp.buf.code_action()<CR>")
      key_mapper.n_noremap_silent("gd",
      ":lua vim.lsp.buf.definition()<CR>")
      key_mapper.n_noremap_silent("gs",
      "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
      key_mapper.n_noremap_silent("K",
      "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
      key_mapper.n_noremap_silent("<C-f>",
      "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
      key_mapper.n_noremap_silent("<C-b>",
      "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
      key_mapper.n_noremap_silent("<leader>ca",
      "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
      key_mapper.v_noremap_silent("<leader>ca",
      "<cmd><C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")

      key_mapper.n_noremap_silent("<leader>vws",
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
      key_mapper.n_noremap_silent("<leader>vd",
      "<cmd>lua vim.diagnostic.open_float()<CR>")
      key_mapper.n_noremap_silent("[[",
      ":lua vim.diagnostic.goto_next()<CR>")
      key_mapper.n_noremap_silent("]]",
      ":lua vim.diagnostic.goto_prev()<CR>")
      key_mapper.n_noremap_silent("<leader>cr",
      ":lua vim.lsp.buf.references()<CR>")
      key_mapper.n_noremap_silent("<leader>rr",
      "<cmd>lua require('lspsaga.rename').rename()<CR>")
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

require("symbols-outline").setup({
	highlight_hovered_item = true,
	show_guides = true,
})

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' }  }))

