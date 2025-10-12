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

    local servers = {}

    local linter_and_formatters = {
      "mypy",       -- Python type checker
      "standardrb", -- Ruby linter
      "erb-lint",   -- Ruby templating linter
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
