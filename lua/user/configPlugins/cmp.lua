local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.close(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

-- Integração autopairs com cmp
local autopairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

