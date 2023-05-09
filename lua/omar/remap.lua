-- goes back to netrw explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- when in visual mode J and K move highlighted text down and up respectively
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- does not replace the text in the register with the highlighted text when pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yanking to the systems clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- formats the code
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- replaces the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
