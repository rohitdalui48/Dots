return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities() --for auto-complitions

		--coding
		vim.lsp.config["lua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			capabilities = capabilities,
		}
		vim.lsp.config["clangd"] = {
			cmd = { "clangd" },
			filetypes = { "c", "cpp" },
			capabilities = capabilities,
		}
		vim.lsp.config["pyright"] = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			capabilities = capabilities,
		}
		vim.lsp.config["bash-language-server"] = {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh", "zsh" },
			capabilities = capabilities,
		}
		--enabled servers
		vim.lsp.enable({
			"lua_ls",
			"clangd",
			"marksman",
			"pyright",
			"bash-language-server",
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
		vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, { desc = "Global Rename" })
	end,
}
