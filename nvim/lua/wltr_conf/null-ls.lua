local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.stylua,
	formatting.markdownlint,
	formatting.beautysh,

	formatting.black,
	formatting.ruff,

	--diagnostics.mypy.with({ generator_factory = true}),

	diagnostics.ruff,
	diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function()
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
})
