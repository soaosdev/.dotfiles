return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = {
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},
		keys = {
			{ "<leader>f",  "<cmd>lua vim.lsp.buf.format()<cr>",        desc = "Format Buffer" },
			{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>",   desc = "View Code Actions" },
			{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>",   desc = "Rename Symbol" },
			{ "<leader>e",  "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "View Diagnostics" },
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = true,
			},
			inlay_hints = {
				enabled = true,
			},
			codelens = {
				enabled = true,
			},
			document_highlight = {
				enabled = true,
			},
			capabilities = {
				textDocument = {
					foldingRange = {
    						dynamicRegistration = false,
    						lineFoldingOnly = true,
					},
				},
			},
			servers = {
				rust_analyzer = {
					mason = false,
					settings = {
						cargo = {
							allFeatures = true,
						}
					}
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				pyright = {
					mason = false,
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "off"
							}
						}
					}
				},
			},
			setup = {},
		},
		config = function(_, opts)
			local servers = opts.servers
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities(),
				opts.capabilities or {}
			)

			local function setup(server)
				local server_opts = vim.tbl_deep_extend(
					"force",
					{
						capabilities = vim.deepcopy(capabilities),
					},
					servers[server] or {}
				)

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local all_mlsp_servers = {}
			if have_mason then
				all_mlsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server")
					.lspconfig_to_package)
			end

			local ensure_installed = {}
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			if have_mason then
				mlsp.setup({ ensure_installed = ensure_installed })
				mlsp.setup_handlers({ setup })
			end

		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
