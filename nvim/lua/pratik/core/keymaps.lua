-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- Most basic
keymap.set("n", "<leader>ss", "<cmd>w<CR>", { desc = "Save current split" }) -- :w on current split
keymap.set("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Save current split" }) -- :w on current split

-- use jk & kj  to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Resize the window

keymap.set("n", "<leader>si", "<cmd>vertical resize +5<CR>", { desc = "Increase the split window size" })
keymap.set("n", "<leader>sd", "<cmd>vertical resize -5<CR>", { desc = "Decrease the split window size" })

---------------------
-- Colorscheme
---------------------
keymap.set(
	"n",
	"<leader>ud",
	":colorscheme tokyonight-moon<CR>",
	{ silent = false, desc = "Toggle default dark theme" }
)
keymap.set("n", "<leader>ui", ":colorscheme ", { desc = "Toggle colorscheme" }) -- Toggle colorscheme and installed themes easily
keymap.set("n", "<leader>ul", ":colorscheme github_light<CR>", { desc = "Toggle default light theme" })

---------------------
-- Move text up and down
---------------------
keymap.set("n", "<Down>", ":m .+1<CR>==", { noremap = true, silent = true }, { desc = "Move current line down" })
keymap.set("n", "<Up>", ":m .-2<CR>==", { noremap = true, silent = true }, { desc = "Move current line up" })
