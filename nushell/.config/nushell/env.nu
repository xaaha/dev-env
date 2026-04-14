# env.nu
#
# Installed by:
# version = "0.112.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Generate mise and zoxide scripts before config.nu loads
let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu | save $mise_path --force

^zoxide init nushell | save ($nu.default-config-dir | path join zoxide.nu) --force
