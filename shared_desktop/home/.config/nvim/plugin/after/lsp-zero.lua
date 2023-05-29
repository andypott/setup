local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = {
		set_sources = "recommended",
		set_extra_mappings = true,
	},
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 5000,
	},
	servers = {
		["null-ls"] = {
			"c",
			"css",
			"go",
			"html",
			"javascript",
			"lua",
			"rust",
			"typescript",
		},
	},
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = true }
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set("n", "<leader>=", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
end)

lsp.ensure_installed({
	"bashls",
	"clangd",
	"cssls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"rust_analyzer",
	"tsserver",
})

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

--local null_ls = require("null-ls")
--null_ls.setup()
require("mason-null-ls").setup({
	ensure_installed = {
		"clang-format",
		"goimports",
		"prettier",
		"rustfmt",
		"stylua",
	},
	handlers = {},
})

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "neorg" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
})
