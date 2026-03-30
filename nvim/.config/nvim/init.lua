--- config reference: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#lazy-loading
vim.g.mapleader = " "

vim.pack.add({
  --- Dependencies -------
  "https://github.com/b0o/schemastore.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/rafamadriz/friendly-snippets",
  --- plugins ----
  "https://github.com/ibhagwan/fzf-lua",                                -- picker
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",       -- md
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/saghen/blink.indent",                             -- indent
  "https://github.com/lewis6991/gitsigns.nvim",                         --gitsigns
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.1" }, --completion
  "https://github.com/stevearc/conform.nvim",                           -- formatting
  "https://github.com/mfussenegger/nvim-lint",                          -- linting
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/hedyhli/outline.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context", -- must come after treesitter
}, { load = true })

local setKeyMap = vim.keymap.set

----- Markdown ------
vim.cmd("RenderMarkdown toggle")
vim.keymap.set("n", "<leader>tm", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle RenderMarkdown" })

--- Outline ----
require("outline").setup({
  outline_window = {
    position = 'left',
    width = 30
  }
})
setKeyMap("n", "<leader>a", "<cmd>Outline<CR>", { desc = "Toggle outline/aerial view" })
--- Fzf Lua ----
require("fzf-lua").setup({
  "fzf-vim", -- multiple profiles :FzfLua Profiles
  defaults = {
    multiline = 1,
  },
  winopts = {
    height = 0.95,
    width = 0.55,
    preview = {
      hidden = false,
      scrollbar = false,
      layout = 'vertical',
      vertical = 'up:50%',
    },
  },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
  },
  grep = {
    hidden = true, -- enable search in hidden files by default
    no_ignore = true,
    actions = {
      ["ctrl-h"] = require("fzf-lua.actions").toggle_hidden,
      ["ctrl-i"] = require("fzf-lua.actions").toggle_ignore,
    },
    rg_opts = table.concat({
      "--column",
      "--line-number",
      "--no-heading",
      "--color=always",
      "--smart-case",
      "--max-columns=4096",
      "--glob=!node_modules/**",
      "--glob=!.git/**",
      "-e"
    }, " "),
    rg_glob = true,
  },
  files = {
    winopts    = {
      preview = { hidden = true },
    },
    cwd_prompt = false,
    prompt     = 'Files❯ ',
    fd_opts    =
    [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules --exclude __pycache__]],
    actions    = {
      ["ctrl-g"] = require("fzf-lua.actions").toggle_ignore,
      ["ctrl-h"] = require("fzf-lua.actions").toggle_hidden,
    },
    hidden     = true,
    no_ignore  = true,
  },
  lsp = {
    code_actions = {
      prompt = "Code Actions> ",
      async_or_timeout = 5000,
      previewer = "codeaction",
    },
  },
})

setKeyMap(
  "n",
  "<leader>ff",
  "<cmd>FzfLua live_grep<CR>",
  { desc = "Fzf live grep native" }
)
setKeyMap(
  "n",
  "<leader>us",
  "<cmd>FzfLua colorschemes<CR>",
  { noremap = true, silent = true, desc = "Preview and pick color scheme" }
)
setKeyMap("n", "<C-p>", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
setKeyMap("n", "<leader>fc", "<cmd>FzfLua grep_cword<cr>", { desc = "Find string under cursor in cwd" })
setKeyMap("n", "<leader>fw", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Grep in current buffer" })
setKeyMap("n", "<c-b>", "<cmd>FzfLua buffers<CR>", { desc = "Find all files (including hidden) in cwd" })
setKeyMap("n", "<leader>ft", "<cmd>FzfLua git_status<CR>", { desc = "Find git_status files" })
setKeyMap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Find lsp_document_symbols" })
setKeyMap("n", "<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "Find lsp_workspace_symbols" })
setKeyMap("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", { desc = "Find Keymaps" })
setKeyMap("n", "<c-m>", "<cmd>FzfLua resume<CR>", { desc = "Resume Last Fzf Search" })
setKeyMap(
  "n",
  "<leader>wd",
  "<cmd>FzfLua diagnostics_workspace<CR>",
  { desc = "List Current Workspace diagnostics" }
)

---- Gitsigns  -----
require("gitsigns").setup({
  preview_config = { border = "rounded" },
  vim.keymap.set("n", "<leader>G", ":Gitsigns<CR>", { desc = "Toggle Gitsigns selector" }),
  vim.keymap.set("n", "<leader>hl", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk in line" }),
  vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" }),
  vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" }),
  vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>", { desc = "Diff this page" }),
  vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" }),
  vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", { desc = "Next hunk" }),
  vim.keymap.set("n", "<leader>bb", ":Gitsigns blame_line<CR>", { desc = "Blame line awesome" }),
})


----- Blink Completion -----
require('blink.cmp').setup({
  fuzzy = {
    implementation = "prefer_rust",
  },
  completion = {
    menu = {
      border = "rounded",
      draw = { gap = 1 },
    },
  },
  cmdline = {
    enabled = true,
    completion = {
      menu = {
        auto_show = true, -- false is default and requires user to hit tab to show the menu
      },
    },
  },
  keymap = { preset = "default" },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = {
    enabled = true,
    window = {
      border = "single",
    },
  },
})

----- Lsp Formatting: Conform -----
require("conform").setup({
  formatters_by_ft = {
    astro = { "prettier" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
    bash = { "shfmt" },
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
    toml = { "tombi" },
    ruby = { "rubocop" }
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 2000,
  },
})

setKeyMap({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })


---- Linting ------
require("lint").linters_by_ft = {
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  javascriptreact = { "biomejs" },
  typescriptreact = { "biomejs" },
  python = { "ruff" },
  go = { "golangcilint" }, -- revive
  ruby = { "rubocop" },    -- standardrb
  sql = { "sqruff" },
  yaml = { "yamllint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

setKeyMap("n", "<leader>l", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })


---- Oil -----
require("oil").setup({
  delete_to_trash = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
    is_always_hidden = function(name, _)
      return name == ".."
          or name == ".git"
          or name == ".DS_Store"
          or name == ".mypy_cache"
          or name == ".pytest_cache"
          or name == "__pycache__"
    end,
  },
  keymaps = {
    ["<C-c>"] = false,
    ["q"] = "actions.close",
    ["<C-p>"] = false,
    ["<C-o>"] = "actions.preview",
  },
})
setKeyMap("n", "<C-n>", "<cmd>Oil<cr>", { desc = "Open Oil" })

----- Treesitter -----
-- modified version of code from this config
--https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-fredrik/lua/fredrik/plugins/core/treesitter.lua
local ts_ensure_installed = {
  "astro",
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
}

-- Install parsers and register them for filetypes
require("nvim-treesitter").install(ts_ensure_installed)
for _, parser in ipairs(ts_ensure_installed) do
  vim.treesitter.language.register(parser, parser)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = parser,
    callback = function(event)
      vim.treesitter.start(event.buf, parser)
    end,
  })
end

-- Auto-install and start parsers for any buffer not in the list above
vim.api.nvim_create_autocmd("BufRead", {
  callback = function(event)
    local bufnr = event.buf
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

    if filetype == "" then
      return
    end

    -- Skip if already handled by ts_ensure_installed
    if vim.tbl_contains(ts_ensure_installed, filetype) then
      return
    end

    local parser_name = vim.treesitter.language.get_lang(filetype)
    if not parser_name then
      return
    end

    local parser_configs = require("nvim-treesitter.parsers")
    if not parser_configs[parser_name] then
      return
    end

    local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

    if not parser_installed then
      require("nvim-treesitter").install({ parser_name }):wait(30000)
    end

    parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

    if parser_installed then
      vim.treesitter.start(bufnr, parser_name)
    end
  end,
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

--- Treesitter Context -----
require 'treesitter-context'.setup({
  multiwindow = true,
})

--- Load finally
require("core")
