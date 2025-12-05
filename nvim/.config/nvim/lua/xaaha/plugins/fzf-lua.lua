return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      "fzf-vim", -- multiple profiles :FzfLua Profiles
      fzf_bin = 'sk',
      defaults = {
        multiline = 1,
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
        cwd_prompt = false,
        prompt     = 'Files❯ ',
        fd_opts    = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules]],
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

    vim.cmd("FzfLua register_ui_select")

    local customKeymap = vim.api.nvim_set_keymap
    customKeymap(
      "n",
      "<C-i>",
      "<cmd>FzfLua live_grep<CR>",
      { noremap = true, silent = true, desc = "Fzf live grep native" }
    )
    customKeymap(
      "n",
      "<leader>us",
      "<cmd>FzfLua colorschemes<CR>",
      { noremap = true, silent = true, desc = "Preview and pick color scheme" }
    )
    customKeymap("n", "<C-p>", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
    customKeymap("n", "<leader>fc", "<cmd>FzfLua grep_cword<cr>", { desc = "Find string under cursor in cwd" })
    customKeymap("n", "<leader>fw", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Grep in current buffer" })
    customKeymap("n", "<c-b>", "<cmd>FzfLua buffers<CR>", { desc = "Find all files (including hidden) in cwd" })
    customKeymap("n", "<leader>ft", "<cmd>FzfLua git_status<CR>", { desc = "Find git_status files" })
    customKeymap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Find lsp_document_symbols" })
    customKeymap("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", { desc = "Find Keymaps" })
    customKeymap("n", "<c-m>", "<cmd>FzfLua resume<CR>", { desc = "Resume Last Fzf Search" })
    customKeymap(
      "n",
      "<leader>wd",
      "<cmd>FzfLua diagnostics_workspace<CR>",
      { desc = "List Current Workspace diagnostics" }
    )
  end,
}
