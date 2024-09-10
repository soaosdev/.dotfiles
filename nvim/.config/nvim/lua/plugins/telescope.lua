return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
		opts = {
			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
				project = {
					base_dirs = {
						"~/.local/src"
					},
				},
			}
		},
		keys = {
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find Diagnostics" }
		},
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Find Files" }
		},
		config = function(_, _)
			require("telescope").load_extension("file_browser")
		end
	},
	{
		'nvim-telescope/telescope-project.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim',
		},
		cmd = {
			"Telescope project",
		},
		config = function(_, _)
			require("telescope").load_extension("project")
		end
	},
	{
		'davidgranstrom/telescope-scdoc.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim',
		},
		cmd = {
			"Telescope scdoc",
		},
		keys = {
			{ "<leader>fs", "<cmd>Telescope scdoc<cr>", desc = "Search scdoc" }
		},
		config = function(_, _)
			require("telescope").load_extension("scdoc")
		end
	},
	{
		'nvim-telescope/telescope-dap.nvim',
		config = function()
			require('telescope').load_extension('dap');
		end
	}
}
