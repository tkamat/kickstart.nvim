-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- tmux + neovim integration
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  { -- java lsp plugin
    'mfussenegger/nvim-jdtls',
  },

  { -- project switcher w/ telescope integration
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {}
    end,
  },

  { -- git fugitive
    'https://tpope.io/vim/fugitive.git',
    cmd = {
      'Git',
    },
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = '[G]it [s]tatus' },
    },
  },

  { -- flash label navigator
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    { -- trouble quickfix and diagnostics
      'folke/trouble.nvim',
      branch = 'main', -- IMPORTANT!
      keys = {
        {
          '<leader>xx',
          '<cmd>Trouble diagnostics toggle<cr>',
          desc = 'Diagnostics (Trouble)',
        },
        {
          '<leader>xX',
          '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
          desc = 'Buffer Diagnostics (Trouble)',
        },
        {
          '<leader>cs',
          '<cmd>Trouble symbols toggle focus=false<cr>',
          desc = 'Symbols (Trouble)',
        },
        {
          '<leader>cl',
          '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
          desc = 'LSP Definitions / references / ... (Trouble)',
        },
        {
          '<leader>xl',
          '<cmd>Trouble loclist toggle<cr>',
          desc = 'Location List (Trouble)',
        },
        {
          '<leader>xq',
          '<cmd>Trouble qflist toggle<cr>',
          desc = 'Quickfix List (Trouble)',
        },
      },
      opts = {}, -- for default options, refer to the configuration section for custom setup.
    },
  },

  { -- oil file browser
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        float = {
          -- Padding around the floating window
          padding = 10,
          max_width = 80,
          max_height = 0,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
        },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-s>'] = 'actions.select_vsplit',
          ['<C-v>'] = 'actions.select_split',
        },
      }
    end,
  },

  { -- top bar
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {},
  },

  {
    'MaximilianLloyd/ascii.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  { -- startup screen
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      ascii = require 'ascii'
      require('dashboard').setup {
        config = {
          header = ascii.art.text.neovim.sharp,
          shortcut = {
            { desc = '📦 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = '📂 ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = '🗄️ Projects',
              group = 'DiagnosticHint',
              action = 'Telescope projects',
              key = 'p',
            },
            {
              desc = '⚙️  dotfiles',
              group = 'Number',
              action = "lua require 'telescope.builtin'.find_files { cwd = vim.fn.stdpath 'config' }",
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },

  { -- cellular automaton
    'eandrju/cellular-automaton.nvim',
    keys = {
      { '<leader>ml', '<cmd>CellularAutomaton game_of_life<cr>', desc = 'Game of [l]ife' },
      { '<leader>mr', '<cmd>CellularAutomaton make_it_rain<cr>', desc = 'Make it [r]ain' },
      { '<leader>ms', '<cmd>CellularAutomaton scramble<cr>', desc = '[S]cramble' },
    },
  },

  { -- theme colored devicons
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function()
      local theme_colors = require('catppuccin.palettes').get_palette 'mocha'
      require('tiny-devicons-auto-colors').setup {
        colors = theme_colors,
      }
    end,
  },

  { -- leetcode integration
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',

      -- optional
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      lang = 'python3',
      injector = {
        ['python3'] = {
          before = true,
        },
      },
    },
    keys = {
      { '<leader>ll', '<cmd>Leet<cr>', desc = '[L]eetcode dashboard' },
      { '<leader>lr', '<cmd>Leet run<cr>', desc = '[L]eetcode [r]un' },
      { '<leader>ls', '<cmd>Leet submit<cr>', desc = '[L]eetcode [s]ubmit' },
      { '<leader>lo', '<cmd>Leet open<cr>', desc = '[L]eetcode [o]pen' },
      { '<leader>lu', '<cmd>Leet cache update<cr>', desc = '[L]eetcode [u]pdate' },
    },
  },

  { -- latex
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function() end,
  },

  { -- highlight colors
    'brenoprata10/nvim-highlight-colors',
    opts = {},
  },

  { -- notifications
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    keys = {
      {
        '<leader>nd',
        '<cmd>Noice dismiss<cr>',
        desc = '[N]oice [d]ismiss',
      },
    },
  },
}
