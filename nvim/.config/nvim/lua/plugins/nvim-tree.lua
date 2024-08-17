return {
	'nvim-tree/nvim-tree.lua',
	keys = {
		{ '<leader>;', '<cmd>NvimTreeToggle<cr>', desc = "Toggle Tree" }
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	}
}
