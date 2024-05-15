return {
  {
    'freddiehaddad/feline.nvim',
    opts = {},
    config = function ()
      local ctp_feline = require('catppuccin.groups.integrations.feline')

      ctp_feline.setup()

      require("feline").setup({
        components = ctp_feline.get(),
      })
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          package.loaded["feline"] = nil
          package.loaded["catppuccin.groups.integrations.feline"] = nil
          require("feline").setup {
            components = require("catppuccin.groups.integrations.feline").get(),
          }
        end,
      })
    end
  }
}
