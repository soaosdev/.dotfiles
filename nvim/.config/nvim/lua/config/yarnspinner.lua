
vim.filetype.add({
	extension = {
		yarn = "yarnspinner"
	}
})

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.yarn_language_server then
	configs.yarn_language_server = {
		default_config = {
			cmd = {'dotnet', '/home/si/.local/bin/YarnLanguageServer/YarnLanguageServer.dll'},
			filetypes = { 'yarnspinner' },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end

lspconfig.yarn_language_server.setup{}
