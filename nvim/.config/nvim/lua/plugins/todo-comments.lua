return {
	'folke/todo-comments.nvim',
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todo" }
	},
	opts = {},
}
