if vim.g.vscode then
	require("config.lazy")
	require("config.settings")
else
	require("config.keybinds")
	require("config.settings")
	require("config.lazy")
end
