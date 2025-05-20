-- Auto save a cada 10 segundos
local timer = vim.loop.new_timer()

-- Configura o timer para salvar o arquivo a cada 10 segundos
timer:start(0, 10000, vim.schedule_wrap(function()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_get_option(bufnr, "modified") then
    vim.cmd("silent! write")
    print("Arquivo salvo automaticamente.")
  end
end))

