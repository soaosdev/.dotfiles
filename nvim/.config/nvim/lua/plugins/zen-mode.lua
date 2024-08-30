return {
	{
		'folke/zen-mode.nvim',
		keys = {
			{ "<leader>zm", "<cmd>ZenMode<cr>", desc = 'Toggle Zen Mode' }
		},
		dependencies = {
			'folke/twilight.nvim',
		},
	}
}
