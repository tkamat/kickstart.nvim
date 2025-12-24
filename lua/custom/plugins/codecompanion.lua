return {
  {
    'olimorris/codecompanion.nvim',
    version = '^18.0.0',
    opts = {
      interactions = {
        chat = {
          adapter = 'claude_code',
        },
        inline = {
          adapter = 'claude_code',
        },
        cmd = {
          adapter = 'claude_code',
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    adapters = {
      acp = {
        claude_code = function()
          return require('codecompanion.adapters').extend('claude_code', {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = 'sk-ant-oat01-gldtlgg30CQkRJqVH0l5omJwg89SQJ1JhE8gjTa6nu3qFs7gjY14CUI6fFzSqwu8SH6iDPNeb2E6PU61PIVD7Q-mMe2vQA',
            },
          })
        end,
      },
    },
  },
}
