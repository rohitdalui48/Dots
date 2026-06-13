return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		languages = {
			"lua",
			"c",
			"cpp",
			"python",
			"bash",
		}
		fileTypes = {
			"lua",
			"c",
			"cpp",
			"python",
			"bash",
		}
		require("nvim-treesitter").install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = fileTypes,
			callback = function()
				vim.treesitter.start()
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
