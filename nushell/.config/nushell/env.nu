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

# Generate shell integration scripts only if missing.
# Run `nu-refresh` after updating mise, zoxide, or starship to regenerate.
let mise_path = $nu.default-config-dir | path join mise.nu
if not ($mise_path | path exists) {
    ^mise activate nu | save $mise_path --force
}

let zoxide_path = $nu.default-config-dir | path join zoxide.nu
if not ($zoxide_path | path exists) {
    ^zoxide init nushell | save $zoxide_path --force
}

let starship_path = $nu.default-config-dir | path join starship.nu
if not ($starship_path | path exists) {
    ^mise exec starship -- starship init nu | save $starship_path --force
}
