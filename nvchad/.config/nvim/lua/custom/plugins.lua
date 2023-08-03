local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"dockerfile-language-server",
				"eslint_d",
				"lua-language-server",
				"prettierd",
				"typescript-language-server",
				"clangd",
				"clang-format",
				"codelldb",
				"gopls",
				"gofumpt",
				"goimports-reviser",
				"golines",
				"rust-analyzer",
				"rustfmt",
				"stylua",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"html",
				"css",
				"bash",
				"javascript",
				"typescript",
				"rust",
				"go",
				"query",
				"tsx",
				"vim",
				"vimdoc",
				"lua",
				"c",
				"cpp",
				"dockerfile",
				"yaml",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
			require("custom.configs.null-ls")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		lazy = false,
		init = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			function _lazydocker_toggle()
				lazydocker:toggle()
			end

			vim.api.nvim_set_keymap("n", "<A-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ld",
				"<cmd>lua _lazydocker_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			hijack_cursor = true,
			sync_root_with_cwd = true,
			git = { enable = true },
			renderer = {
				highlight_git = true,
				full_name = true,
				group_empty = true,
				special_files = {},
				symlink_destination = false,
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "after",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = { "help" },
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			actions = {
				change_dir = {
					enable = false,
					restrict_above_cwd = true,
				},
				open_file = {
					resize_window = true,
				},
				remove_file = {
					close_window = false,
				},
			},
		},
	},
}

return plugins
