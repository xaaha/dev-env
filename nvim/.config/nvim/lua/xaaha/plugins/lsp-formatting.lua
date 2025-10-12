return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        astro = { "prettier" },
        javascript = { "biome", "prettier", "biome-organize-imports" },
        typescript = { "biome", "prettier", "biome-organize-imports" },
        javascriptreact = { "biome", "prettier", "biome-organize-imports" },
        typescriptreact = { "biome", "prettier", "biome-organize-imports" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "biome", "prettier" },
        yaml = { "yq", "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        go = { "gofumpt", "golines", "goimports" },
        sql = { "sqruff" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
