local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }
local map = { noremap = false }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", noremap)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
--   n / v / s / o = '',


----- basic keys -----
keymap("n", "<C-P>", ":", map)
keymap("i", "<C-g>", "<Esc>", map)
keymap("t", "<C-g><C-g>", "<C-\\><C-n>", map)

-- save
keymap("n", "<C-s>", ":update<Return>", noremap)
keymap("n", "<Leader><C-s>", ":noa update<Return>", noremap)

-- not yank line break
keymap("n", "Y", "y$", noremap)

-- not yank with x
keymap("", "x", '"_x', noremap)
keymap("", "X", '"_X', noremap)

-- redo with U
keymap("n", "U", "<c-r>", noremap) -- bind new keymap

-- home / end
keymap("", "<C-h>", "^", noremap)
keymap("", "<C-l>", "$", noremap)

-- serach
keymap("n", "<C-f>", "/", noremap)
keymap("x", "<C-f>", 'y/\\V<C-R>"<CR>', noremap)

-- replace searched word
keymap("n", "<c-r>", ":%s//gc<Left><Left><Left>", noremap)
keymap("v", "<c-r>", ":s//gc<Left><Left><Left>", noremap)

-- press esc twice to hide highlight
keymap("n", "<Esc><Esc>", ":noh<Return>", noremap)

-- stay in indent mode
keymap("v", "<", "<gv", noremap)
keymap("v", ">", ">gv", noremap)

-- select cursor to end (not line break)
keymap("v", "<C-l>", "$h", noremap)


----- window / tabs -----
-- split window
keymap("n", "<C-w>s", ":new<Return><C-w>j", noremap)
keymap("n", "<C-w>v", ":vnew<Return><C-w>l", noremap)

-- close buffer
keymap("n", "<C-w>w", ":bd<Return>", noremap)

-- new tab
keymap("n", "<C-w>t", ":tabedit<Return>", silent_noremap)

-- move tab
keymap("n", "<C-w>p", "gT", noremap)
keymap("n", "<C-w>n", "gt", noremap)

-- move tab order
keymap("n", "<C-w>P", ":-tabmove<Return>", silent_noremap)
keymap("n", "<C-w>N", ":+tabmove<Return>", silent_noremap)

-- open current buffer on new tab
keymap("n", "<C-w>z", ":tabedit %<Return>", silent_noremap)

----- quickfix / location -----
keymap("n", "[q", ":cprevious<Return>", silent_noremap)
keymap("n", "]q", ":cnext<Return>", silent_noremap)
keymap("n", "[<S-q>", ":cfirst<Return>", silent_noremap)
keymap("n", "]<S-q>", ":clast<Return>", silent_noremap)

keymap("n", "[l", ":lprevious<Return>", silent_noremap)
keymap("n", "]l", ":lnext<Return>", silent_noremap)
keymap("n", "[<S-l>", ":lfirst<Return>", silent_noremap)
keymap("n", "]<S-l>", ":llast<Return>", silent_noremap)
