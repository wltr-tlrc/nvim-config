local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.stylua,
	formatting.markdownlint,
	formatting.beautysh,
	formatting.shfmt,

	formatting.black,
	formatting.isort,
	formatting.ruff,

	--diagnostics.pylint,
	--diagnostics.flake8,
	--diagnostics.mypy,
	--diagnostics.black,
	diagnostics.ruff,
	diagnostics.shellcheck.with({diagnostics_format="#{m} [#{c}]"}),

}

--null_ls.setup({
--	sources = sources,

--	on_attach = function(client)
--		if client.server_capabilities.document_formatting then
--			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
--		end
--	end,
--})

null_ls.setup {
	debug = true,
	sources = sources,
	on_attach = function()
		vim.api.nvim_create_autocmd("BufWritePost",{
			callback = function()
				vim.lsp.buf.format()
			end,
	})
	end,
}
