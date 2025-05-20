-- Nvim Tree

vim.keymap.set('n', '<C-n>', function()
  local api = require('nvim-tree.api')
  local view = require('nvim-tree.view')

  if view.is_visible() then
    api.tree.close()
  else
    api.tree.open()
    vim.defer_fn(function()
      api.tree.focus()
    end, 50)
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-c>', function()
  local api = require('nvim-tree.api')
  local view = require('nvim-tree.view')

  if view.is_visible() then
    local tree_win = view.get_winnr()
    local cur_win = vim.api.nvim_get_current_win()
    if cur_win == tree_win then
      vim.cmd('wincmd p')
    else
      api.tree.focus()
    end
  end
end, { noremap = true, silent = true })


-- GitHub Copilot
vim.api.nvim_set_keymap('i', '<C-Space>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Salvando e saindo
vim.api.nvim_set_keymap('n', '<C-w>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':q!<CR>', { noremap = true, silent = true })

--- Telescope
vim.api.nvim_set_keymap('n', '<C-f>', 
  "<cmd>lua require('telescope.builtin').find_files({ cwd = os.getenv('HOME') })<CR>", 
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

