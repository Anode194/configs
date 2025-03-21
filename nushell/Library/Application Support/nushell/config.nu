# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.path ++= ["/opt/homebrew/bin/"]
$env.path ++= ["/usr/local/bin/"]
$env.path ++= ["~/.joplin-bin/bin/joplin"]
$env.path ++= ["~/.cargo/bin/"]
$env.path ++= ["/Users/anode/Code/bin/"]
$env.config.buffer_editor = "/opt/homebrew/bin/nvim"
$env.config.buffer_editor = "nvim"
$env.PROMPT_INDICATOR_VI_NORMAL = " : "
$env.PROMPT_INDICATOR_VI_INSERT = " : "
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.show_banner = false
source ~/Code/nu_scripts/themes/nu-themes/tokyo-night.nu
alias nu-open = open
alias open = ^open
alias v = nvim
alias j = joplin
