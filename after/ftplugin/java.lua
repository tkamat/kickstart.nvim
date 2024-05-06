local jdtls = require 'jdtls'

local root_dir = jdtls.setup.find_root({ 'packageInfo' }, 'Config')
local home = os.getenv 'HOME'
local workspace_dir = home .. '/.local/share/eclipe/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local ws_folders_jdtls = {}
if root_dir then
  local file = io.open(root_dir .. '/.bemol/ws_root_folders')
  if file then
    for line in file:lines() do
      table.insert(ws_folders_jdtls, 'file://' .. line)
    end
    file:close()
  end
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    require('mason-registry').get_package('jdtls'):get_install_path() .. '/jdtls', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    '--jvm-arg=-javaagent:'
      .. require('mason-registry').get_package('jdtls'):get_install_path()
      .. '/lombok.jar',
    '-data',
    workspace_dir,
  },

  -- ToDo
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    workspaceFolders = ws_folders_jdtls,
    -- extendedClientCapabilities = {
    --   classFileContentsSupport = true
    -- }
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
