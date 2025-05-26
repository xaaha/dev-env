-- once lazy updates,
-- https://www.lazyvim.org/plugins/treesitter#nvim-treesitter-textobjects
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		config = function()
			local ts = require("nvim-treesitter")
			local installed = require("nvim-treesitter.config").installed_parsers()
			local parsers_to_install = vim.iter({
				"bash",
				"c",
				"css",
				"diff",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"graphql",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"json5",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"ruby",
			})
				:filter(function(name)
					return not vim.tbl_contains(installed, name)
				end)
				:totable()

			if #parsers_to_install > 0 then
				ts.install(parsers_to_install)
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		keys = {
			{
				"af",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
				end,
				desc = "Select outer function",
				mode = { "x", "o" },
			},
			{
				"if",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
				end,
				desc = "Select inner function",
				mode = { "x", "o" },
			},
			{
				"ac",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
				end,
				desc = "Select outer class",
				mode = { "x", "o" },
			},
			{
				"ic",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
				end,
				desc = "Select inner class",
				mode = { "x", "o" },
			},
			{
				"as",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
				end,
				desc = "Select local scope",
				mode = { "x", "o" },
			},
		},
		---@module "nvim-treesitter-textobjects"
		opts = {},
	},
}
