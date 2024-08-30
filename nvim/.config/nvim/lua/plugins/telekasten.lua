return {
	'nvim-telekasten/telekasten.nvim',
	dependencies = {'nvim-telescope/telescope.nvim'},
	opts = {
		home = vim.fn.expand("~/Documents/Telekasten"),
	},
	keys = {
		{"<leader>z", "<CMD>Telekasten panel<CR>", desc="Telekasten Panel"},
		{"<leader>zf", "<CMD>Telekasten find_notes<CR>", desc="Find Notes"},
		{"<leader>zg", "<CMD>Telekasten search_notes<CR>", desc="Search Notes"},
		{"<leader>zd", "<CMD>Telekasten goto_today<CR>", desc="Go to Today's Note"},
		{"<leader>zz", "<CMD>Telekasten follow_link<CR>", desc="Follow Link"},
		{"<leader>zn", "<CMD>Telekasten new_note<CR>", desc="New Note"},
		{"<leader>zc", "<CMD>Telekasten show_calendar<CR>", desc="Show Calendar"},
		{"<leader>zb", "<CMD>Telekasten show_backlinks<CR>", desc="Show Backlinks"},
		{"<leader>zI", "<CMD>Telekasten insert_img_link<CR>", desc="Insert Image Link"},
		{"[[", "<CMD>Telekasten insert_link<CR>", desc="Insert Link", mode={'i'}},
	},
	cmd = {
		"Telekasten"
	}
}
