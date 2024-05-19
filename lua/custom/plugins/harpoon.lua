return {
  { -- harpoon file bookmarker
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    commit = 'e76cb03',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = '[A]dd to harpoon list' })
      vim.keymap.set('n', '<leader>o', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[O]pen harpoon list' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = '[1]st harpoon buffer' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = '[2]st harpoon buffer' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = '[3]st harpoon buffer' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = '[4]st harpoon buffer' })
    end,
  },
}
