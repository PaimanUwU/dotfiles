# ========================================================= Abbreviations
# These will expand as you hit Space or Enter

# Config & Reload
abbr sourcefish 'source ~/.config/fish/config.fish'
abbr fishconfig 'nvim ~/Documents/Dotfiles/fish/config.fish'

# General Tools
abbr code codium
abbr cat bat
abbr h 'cd ~'
abbr v nvim
abbr c clear
alias cd='z'

# Eza (Modern LS)
alias ls 'eza --color=always --long --git --icons=always --no-time --no-user --no-permissions --no-filesize'
alias ezatree 'eza --color=always --long --git --icons=always --no-time --no-user --no-permissions --no-filesize --tree --level=1 --sort=extension --group-directories-first --all -I ".git"'
abbr lt --set-cursor 'ezatree --level=%'

# Git Simplified
abbr gs 'git status'
abbr ga 'git add'
abbr gc --set-cursor 'git commit -m "%"'
abbr gp 'git push -u'
abbr gl "git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Navigation
abbr .. 'cd ..'
abbr ... 'cd ../..'

# Utility
abbr path 'printf "%s\n" $PATH'
abbr myip 'curl -s https://ifconfig.me; echo'

# ========================================================= Complex Aliases
# We keep these as aliases because they involve complex piping or variables
alias cheats='CLICOLOR_FORCE=1 glow -s dark ~/Documents/Dotfiles/Cheatsheets.md | bat --color=always --style=plain --theme="Catppuccin Mocha" --paging=always'
alias mdcheats='CLICOLOR_FORCE=1 glow -s dark ~/Documents/Dotfiles/Markdown-Cheatsheets.md | bat --color=always --style=plain --theme="Catppuccin Mocha" --paging=always'
alias vcheats='CLICOLOR_FORCE=1 glow -s dark ~/Documents/Dotfiles/Nvim-Cheatsheets.md | bat --color=always --style=plain --theme="Catppuccin Mocha" --paging=always'
alias lab='tmux new-window -n "Home Server" "ssh home"'
alias nuke-history='history clear; echo "History nuked! >w<"'
alias whatshell 'status --is-interactive; and echo "You are in fish! >w<"'

# ========================================================= Path & Environment
# Fish uses fish_add_path to handle $PATH safely
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/node@22/bin
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fish_add_path "$HOME/.codeium/windsurf/bin"
fish_add_path "$HOME/.antigravity/antigravity/bin"
fish_add_path "$HOME/.config/herd-lite/bin"
fish_add_path "$HOME/.composer/vendor/bin"
fish_add_path /opt/homebrew/opt/openjdk/bin

set -gx JAVA_HOME (/usr/libexec/java_home)
set -gx PHP_INI_SCAN_DIR "/Users/adiaimanputra/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
set -gx FZF_DEFAULT_OPTS "--style full --preview 'fzf-preview.sh {}' --color 'preview-border:#9999cc,preview-label:#ccccff' --color 'list-border:#9999cc,list-label:#99cc99' --color 'input-border:#669966,input-label:#ffcccc' --color 'header-border:#996666,header-label:#99ccff'"

# if test -f "$HOME/.local/bin/env"
#    source "$HOME/.local/bin/env"
# end

# ========================================================= Functions
# Yazi (Replacement for the Zsh function)
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
    printf '\e[5 q' # Force bar cursor back
end

# Ensure bar cursor in TMUX
if set -q TMUX
    printf '\e[5 q'
end

# ========================================================= Theming
# Syntax Highlighting Colors (Catppuccin Mocha-ish)
set fish_color_normal cdd6f4
set fish_color_command 89b4fa
set fish_color_param f2cdcd
set fish_color_keyword f38ba8
set fish_color_quote a6e3a1
set fish_color_redirection fab387
set fish_color_end f9e2af
set fish_color_error f38ba8
set fish_color_gray 6c7086
set fish_color_selection --background=313244
set fish_color_search_match --background=313244
set fish_color_operator 89dceb
set fish_color_escape eb1a1a
set fish_color_autosuggestion 6c7086

# ========================================================= Initializations
# Enable Vi keybindings
fish_vi_key_bindings

# Force Ctrl+R for all modes (Insert, Normal/Default, and Visual)
bind -M insert \cr history-pager
bind -M default \cr history-pager
bind -M visual \cr history-pager

# Set cursor shapes
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

zoxide init fish | source
starship init fish | source
