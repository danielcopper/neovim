vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>", { desc = 'Show Undotree' })
vim.keymap.set('n', 'Y', 'yg$', { desc = 'Yank till the end of the line' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep the cursor in line when appending the line below' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scrolling down keeps the cursor in the middle of the screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scrolling up keeps the cursor in the middle of the screen' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Jumping to the next result keeps the cursor in the middle of the screen' })
vim.keymap.set('n', 'N', 'Nzzzv',
    { desc = 'Jumping to the previous result keeps the cursor in the middle of the screen' })
vim.keymap.set('n', '<leader>y', '\'+y', { desc = 'Yank into system clipboard' })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = 'Yank into system clipboard' })
vim.keymap.set('n', '<leader>d', '\'_d', { desc = 'Delete into system clipboard' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Prevent from using capital Q' })
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, { desc = 'Quick format the open buffer' })
vim.keymap.set('n', '<leader>sr', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
    { desc = 'Search and Replace the String under the cursor for the current file' })

-- TODO - need testing. probably not working
-- related to the quick fix list -> do some research
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set("v", "J", ":m '<+1<CR>gv=gv", { desc = 'Move selected text bulk down and indent' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected text bulk up and indent' })
vim.keymap.set('v', '<leader>y', '\'+y', { desc = 'Yank into system clipboard' })
vim.keymap.set('v', '<leader>d', '\'_d', { desc = 'Delete into system clipboard' })

vim.keymap.set('x', '<leader>p', '\'_dP', { desc = 'Allows to paste over without loosing the buffer' })