return {
	{
		'folke/zen-mode.nvim',
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = 'Toggle Zen Mode' }
		},
		dependencies = {
			'folke/twilight.nvim',
		},
	}
}
