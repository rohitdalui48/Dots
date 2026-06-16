return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities() --for auto-complitions
		local function get_python_path(workspace)
			local venv = workspace .. "/.venv/bin/python"
			if vim.fn.executable(venv) == 1 then
				return venv
			end
			return vim.fn.exepath("python3") or "python"
		end

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
			before_init = function(_, config)
				config.settings = config.settings or {}
				config.settings.python = config.settings.python or {}
				config.settings.python.pythonPath = get_python_path(config.root_dir)
			end,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
						typeCheckingMode = "basic",
					},
				},
			},
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
