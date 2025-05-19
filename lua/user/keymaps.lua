-- Nvim Tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- GitHub Copilot
vim.api.nvim_set_keymap('i', '<C-Space>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Salvando e saindo
vim.api.nvim_set_keymap('n', '<C-w>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

