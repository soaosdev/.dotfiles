

return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "telekasten" },
    build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_browser = '/usr/bin/firefox';
		vim.g.mkdp_filetypes = {
			"markdown",
			"telekasten",
		};
	end,
}
