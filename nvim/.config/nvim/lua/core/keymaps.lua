local setKeymap = vim.keymap.set -- for conciseness
local opts = { noremap = true, silent = true }

---------------------
-- General Keymaps
---------------------
-- Most basic
setKeymap("n", "<leader>ss", "<cmd>wa<CR>", { desc = "Save all" })
setKeymap("n", "<leader> ", "<cmd>wa<CR>", { desc = "Save current file" })
setKeymap("v", "p", '"_dP', { desc = "Don't override yank on visual mode" })
setKeymap("n", "dd", '"_dd', { desc = "Delete a line without overriding the yank register" })
setKeymap("n", "ycc", "yygccp", { remap = true }) -- copy and comment out the first line and paste
setKeymap("x", "/", "<Esc>/\\%V")                 -- search within visual selection
setKeymap("x", "<leader>r", "<Esc>:'<,'>s/\\%V", { noremap = true })
setKeymap("n", "<leader>`", function()
  vim.api.nvim_put({ "```", "", "```" }, "l", true, true)
  vim.cmd("normal! k")
  vim.cmd("startinsert")
end, { desc = "Add code block and start typing" })

-- Scroll
setKeymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up and center screen" })
setKeymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down and center screen" })

-- clear search highlights
setKeymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
setKeymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
setKeymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
setKeymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal width and height" })
setKeymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Resize the window

setKeymap("n", "<leader>si", "<cmd>vertical resize +5<CR>", { desc = "Increase the split window size" })
setKeymap("n", "<leader>sd", "<cmd>vertical resize -5<CR>", { desc = "Decrease the split window size" })

---------------------
-- Colorscheme
---------------------
vim.cmd.colorscheme("xaaha-dark")
setKeymap("n", "<leader>th", function()
  if vim.o.background == "dark" then
    vim.cmd.colorscheme("xaaha-light")
  else
    vim.cmd.colorscheme("xaaha-dark")
  end
end, { desc = "Toggle theme" })
---------------------
-- Move text up and down
---------------------
--- in normal mode
setKeymap(
  "n",
  "<Down>",
  ":m .+1<CR>==",
  { noremap = true, silent = true, desc = "Move current line down with down arraw key" }
)
setKeymap(
  "n",
  "<Up>",
  ":m .-2<CR>==",
  { noremap = true, silent = true, desc = "Move current line up with up arrow key" }
)
-- in visual, mode use control j or k
setKeymap("v", "<c-j>", ":m .+1<CR>==", opts)
setKeymap("v", "<c-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
setKeymap("x", "J", ":move '>+1<CR>gv-gv", opts)
setKeymap("x", "K", ":move '<-2<CR>gv-gv", opts)
setKeymap("x", "<c-j>", ":move '>+1<CR>gv-gv", opts)
setKeymap("x", "<c-k>", ":move '<-2<CR>gv-gv", opts)

---------------------
-- Copy absolute & relative file path
---------------------

-- Copy relative file path
setKeymap("n", "<leader>cr", function()
  local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.fn.setreg("+", relative_path)
  print("Relative Path: ", relative_path)
end, { noremap = true, silent = true, desc = "Copy relative file path" })

-- Copy absolute file path
setKeymap("n", "<leader>cc", function()
  local absolute_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", absolute_path)
  print("Complete Path: ", absolute_path)
end, { noremap = true, silent = true, desc = "Copy complete/absolute file path" })

---------------------
-- Format files, useful for gitignored files
---------------------

setKeymap(
  "n",
  "<leader>jf",
  [[:%!jq .<CR>:w<CR>]],
  { noremap = true, silent = true, desc = "Format and save json files" }
)

---------------
--- Moving between splits
--------------
setKeymap("n", "<c-k>", ":wincmd k<CR>")
setKeymap("n", "<c-j>", ":wincmd j<CR>")
setKeymap("n", "<c-h>", ":wincmd h<CR>")
setKeymap("n", "<c-l>", ":wincmd l<CR>")
