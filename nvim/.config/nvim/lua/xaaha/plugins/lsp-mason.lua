return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "󰄳 ",
          package_pending = " ",
          package_uninstalled = " ",
        },
      },
    })

    local servers = {
      -- lspconfigName :h lspconfig-all = to Mason package name often "official tool name"
      astro = "astro-language-server",
      biome = "biome", -- JS/TS formatter/linter/LSP
      cssls = "css-lsp",
      emmet_ls = "emmet-ls",
      eslint = "eslint-lsp",
      gopls = "gopls",
      graphql = "graphql-language-service-cli",
      harper_ls = "harper-ls",
      html = "html-lsp",
      jsonls = "json-lsp",
      ruby_lsp = "ruby-lsp",
      ruff = "ruff",
      ts_ls = "typescript-language-server",
      yamlls = "yaml-language-server",
    }

    local linter_and_formatters = {
      "prettier", -- Prettier formatter
      "mypy",     -- Python type checker
      "gofumpt",  -- Go formatter
      "goimports",
      "golines",
      "postgrestools",
      "golangci-lint", -- Go linter
      "revive",
      "standardrb",    -- Ruby linter
      "sqruff",        -- SQL formatter
      "erb-lint",      -- Ruby templating linter
      "yq",            -- YAML formatter
      "yamllint",
    }

    -- Collect all mason tool names from LSPs
    local serversToInstall = {}
    local serversToEnable = {}
    local exclude = {
      "harper_ls",
    }

    for lsp, tool in pairs(servers) do
      table.insert(serversToInstall, tool)
      if not vim.tbl_contains(exclude, lsp) then
        table.insert(serversToEnable, lsp)
      end
    end

    -- Append extra tools to the install list
    vim.list_extend(serversToInstall, linter_and_formatters)

    -- Mason tool installer requires official name (mason package name) not lspconfig name
    require("mason-tool-installer").setup({
      ensure_installed = serversToInstall,
    })

    -- Enable the LSP servers
    vim.lsp.enable(serversToEnable)
  end,
}
