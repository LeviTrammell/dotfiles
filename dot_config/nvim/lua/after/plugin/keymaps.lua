local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("n", "<C-o>", ":Telescope file_browser<CR>", default_opts)
keymap("n", "<C-O>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", default_opts)

--- Better window nav
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)

--- Terminal
keymap("n", "<C-k>", "<C-w>k", default_opts)

keymap("n", "<C-t>", ":split term<CR>", default_opts) -- open
keymap("t", "<Esc>", "<C-\\><C-n>", default_opts) -- exit

--- Telescope
keymap("n", "ff", ":Telescope find_files<CR>", default_opts) -- open
keymap("n", "fc", ":Telescope current_buffer_fuzzy_find<CR>", default_opts) -- open
keymap("n", "fg", ":Telescope live_grep<CR>", default_opts) -- open
keymap("n", "fb", ":Telescope buffers<CR>", default_opts) -- open
keymap("n", "fh", ":Telescope help_tags<CR>", default_opts) -- open
keymap("n", "<C-p>", ":Telescope find_files<CR>", default_opts) -- open

---
-- barbar settings
---

-- Move to previous/next
keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", default_opts)
keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", default_opts)
-- Re-order to previous/next
keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", default_opts)
keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", default_opts)
-- Goto buffer in position...
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", default_opts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", default_opts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", default_opts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", default_opts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", default_opts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", default_opts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", default_opts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", default_opts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", default_opts)
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", default_opts)
-- Pin/unpin buffer
keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", default_opts)
-- Close buffer
keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", default_opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- keymap('n', '<C-p>', '<Cmd>BufferPick<CR>',default_opts)
-- Sort automatically by...
keymap("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", default_opts)
keymap("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", default_opts)
keymap("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", default_opts)
keymap("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", default_opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

vim.keymap.set("n", "gd", vim.lsp.buf.definition, default_opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, default_opts)
vim.keymap.set("n", "gr", vim.lsp.buf.hover, default_opts)
