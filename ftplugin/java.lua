local config = {
  cmd = { '/Users/tkamat/Software/jdt-language-server-latest/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          {
            name = 'JavaSE-18',
            path = '/Users/tkamat/Library/Java/JavaVirtualMachines/openjdk-18.0.1.1/Contents/Home',
          },
        },
      },
    },
  },
}
require('jdtls').start_or_attach(config)
