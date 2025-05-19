require('nvim-tree').setup()

local api = require("nvim-tree.api")

function toggle_nvim_tree_focus()
  if api.tree.is_visible() then
    local win = vim.fn.bufwinid("NvimTree")
    local cur_win = vim.api.nvim_get_current_win()

    if win == -1 then
      -- NvimTree está visível mas sem janela válida, reabre e foca no arquivo
      api.tree.close()
      api.tree.open()
      vim.defer_fn(function()
        api.tree.find_file({ open = true })
      end, 100)
    elseif win == cur_win then
      api.tree.close()
      vim.cmd("wincmd p")
    else
      vim.api.nvim_set_current_win(win)
    end
  else
    api.tree.open()
    vim.defer_fn(function()
      api.tree.find_file({ open = true })
    end, 100)
  end
end

