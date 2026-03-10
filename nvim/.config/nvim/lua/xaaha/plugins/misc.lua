return {
  "b0o/schemastore.nvim",
  "nvim-tree/nvim-web-devicons",
  "saghen/blink.indent",
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      vim.cmd("RenderMarkdown toggle")
      vim.api.nvim_set_keymap("n", "<leader>tm", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle RenderMarkdown" })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
}
