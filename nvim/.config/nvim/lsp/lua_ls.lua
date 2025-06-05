return {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					enable = true,
					globals = { "vim", "Snacks" },
					disable = { "lowercase-global" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	},
}
