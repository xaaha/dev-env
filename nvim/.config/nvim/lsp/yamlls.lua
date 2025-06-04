return {
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	cmd = { "yaml-language-server", "--stdio" },
	dependencies = {
		"b0o/schemastore.nvim",
	},
	root_markers = { ".git" },
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = {
			keyOrdering = false,
			format = { enable = true },
			validate = true,
			schemaStore = { enable = false, url = "" },
			schemas = {
				["https://raw.githubusercontent.com/xaaha/hulak/refs/heads/main/assets/schema.json"] = {
					"**/*.hk.yaml",
					"**/*.hk.yml",
					"**/*.hk.json",
				},
			},
		},
	},
	on_new_config = function(new_config)
		local schemastore_schemas = require("schemastore").yaml.schemas()
		new_config.settings.yaml.schemas =
			vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, schemastore_schemas)
	end,
}
