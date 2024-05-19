local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.checkstyle.with {
            extra_args = { '-c', '/Users/tkamat/checkstyle/sun_checks.xml' }, -- or "/sun_checks.xml" or path to self written rules
          },
        },
      }
    end,
  },
}
