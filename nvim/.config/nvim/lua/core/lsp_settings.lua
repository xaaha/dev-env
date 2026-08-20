vim.diagnostic.config({
  -- virtual_lines = true, -- this gets messy on large code base with tons of errors
  -- Select either virtual lines or text below otherwise it gets messy
  virtual_text = {
    spacing = 4,
    prefix = "●", -- This is fine as a string
  },

  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

-- define common keybindings

local key_mappings = {
  { "gR", "<cmd>FzfLua lsp_references<CR>",      "Show LSP references" },
  { "gD", "<cmd>FzfLua lsp_declarations<CR>",    "Go to declaration" },
  { "gd", "<cmd>FzfLua lsp_definitions<CR>",     "Show LSP definitions" },
  { "gi", "<cmd>FzfLua lsp_implementations<CR>", "Show LSP implementations" },
  { "gt", "<cmd>FzfLua lsp_typedefs<CR>",        "Show LSP type definitions" },
  {
    "<leader>ca",
    function()
      require("fzf-lua").lsp_code_actions({})
    end,
    "Code actions",
  },
  { "<leader>rn", vim.lsp.buf.rename,                         "Smart rename" },
  { "<leader>D",  "<cmd>FzfLua lsp_document_diagnostics<CR>", "Show buffer diagnostics" },
  {
    "<leader>d",
    function()
      vim.diagnostic.open_float({ border = "rounded" })
    end,
    "Show line diagnostics",
  },
  {
    "[d",
    function()
      vim.diagnostic.jump({ count = -1, float = true })
    end,
    "Go to previous diagnostic",
  },
  {
    "]d",
    function()
      vim.diagnostic.jump({ count = 1, float = true })
    end,
    "Go to next diagnostic",
  },
  {
    "K",
    function()
      vim.lsp.buf.hover({ border = "rounded" })
    end,
    "Show documentation",
  },
  { "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
  {
    "<leader>td",
    function()
      local is_enabled = vim.diagnostic.is_enabled()
      vim.diagnostic.enable(not is_enabled)
    end,
    "Toggle Diagnostics for this repo",
  },
}
-- set all keybindings
for _, mapping in ipairs(key_mappings) do
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", mapping[1], mapping[2], vim.tbl_extend("force", opts, { desc = mapping[3] }))
end

-- for ruby format with lsp

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    -- Only do for Ruby files for now
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
    if filetype ~= "ruby" then
      return
    end

    -- Enable formatting on save if supported
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- Enable servers

--:h lspconfig-all for info
local language_servers = {
  -- lspconfigName
  "astro",        -- with default-npm-packages
  "basedpyright", -- python lsp
  "bashls",
  "biome",
  "cssls",                 -- with  vscode-langservers-extracted
  "emmet_language_server", -- with default-npm-packages
  "eslint",                -- with vscode-langservers-extracted
  "gopls",
  "html",                  -- with  vscode-langservers-extracted
  "jsonls",                -- with  vscode-langservers-extracted
  "lua_ls",                -- lsp/formatter
  "ruby_lsp",              -- ruby-lsp in brew
  "ruff",                  -- python
  "ts_ls",                 -- "typescript-language-server", for TypeScript < 7
  "tsc",                   -- native TypeScript >= 7 ("tsc --lsp --stdio")
  "yamlls",                -- "yaml-language-server",
  "rust_analyzer"
  -- "standardrb",            -- ruby linter/formatter with some lsp capabilities
}

for _, server in ipairs(language_servers) do
  vim.lsp.enable(server)
end

-- ts_ls and tsc declare the same filetypes. Only one should attach per
-- project, picked by which TypeScript major version that project actually
-- has installed (local node_modules/.bin/tsc, falling back to global tsc).

local tsc_version_cache = {}

local function find_ts_project_root(bufnr)
  local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", ".git" }
  return vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
end

local function resolve_tsc_binary(root_dir)
  local local_bin = vim.fs.joinpath(root_dir, "node_modules/.bin/tsc")
  if vim.fn.executable(local_bin) == 1 then
    return local_bin
  end
  if vim.fn.executable("tsc") == 1 then
    return "tsc"
  end
  return nil
end

local function tsc_major_version(bin)
  if not bin then
    return nil
  end
  local cached = tsc_version_cache[bin]
  if cached == nil then
    local output = vim.fn.system({ bin, "--version" })
    local major = output:match("Version (%d+)%.")
    cached = major and tonumber(major) or false
    tsc_version_cache[bin] = cached
  end
  return cached or nil
end

local function is_ts7_project(bufnr)
  local root = find_ts_project_root(bufnr)
  local version = tsc_major_version(resolve_tsc_binary(root))
  return version ~= nil and version >= 7, root
end

vim.lsp.config("tsc", {
  root_dir = function(bufnr, on_dir)
    local is_ts7, root = is_ts7_project(bufnr)
    if is_ts7 then
      on_dir(root)
    end
  end,
})

vim.lsp.config("ts_ls", {
  root_dir = function(bufnr, on_dir)
    local is_ts7, root = is_ts7_project(bufnr)
    if not is_ts7 then
      on_dir(root)
    end
  end,
})
