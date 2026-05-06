# ========================================================= Abbreviations
# These will expand as you hit Space or Enter

# Config Reload
abbr sourcefish 'source ~/.config/fish/config.fish'

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
abbr ff 'fastfetch'

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

# Config quick edit
function config --description "Open specific dotfiles quickly"
    switch $argv[1]
        case fish
            nvim ~/Documents/Dotfiles/fish/.config/fish/config.fish
        case tmux
            nvim ~/Documents/Dotfiles/tmux/.config/tmux/tmux.conf
        case ghostty
            nvim ~/Documents/Dotfiles/ghostty/.config/ghostty/config
        case nvim
            nvim ~/Documents/Dotfiles/nvim/.config/nvim/*
        case '*'
            echo "Usage: config [fish|tmux|ghostty|nvim]"
            echo "Unknown configuration: $argv[1]"
    end
end

# For my second-brain
function brain
    set -l notes_dir ~/Documents/Notes
    
    switch "$argv[1]"
        case "search"
            set -l note (fd . $notes_dir --type f --extension md | fzf --preview 'bat --color=always --style=numbers {}')
            test -n "$note"; and nvim $note

        case "new"
            if test (count $argv) -lt 2
                echo "Usage: brain new <title>"; return 1
            end
            set -l title_parts $argv[2..-1]
            set -l date (date +%Y-%m-%d)
            set -l clean_title (string join '-' $title_parts | string lower)
            set -l filename "$notes_dir/00_Inbox/[$date]$clean_title.md"
            echo "# "(string join ' ' $title_parts) > $filename
            nvim $filename

        case "mkdir"
            # Usage: brain mkdir <p|a|r> <folder-name>
            set -l type $argv[2]
            set -l folder_name (string join '-' $argv[3..-1] | string lower)
            
            if test -z "$type"; or test -z "$folder_name"
                echo "Usage: brain mkdir [p|a|r] <name>"
                echo "  p = Projects, a = Areas, r = Resources"
                return 1
            end

            switch $type
                case "p"; set target "10_Projects"
                case "a"; set target "20_Areas"
                case "r"; set target "30_Resources"
                case "*"; echo "Invalid type. Use p, a, or r."; return 1
            end

            set -l full_path "$notes_dir/$target/$folder_name"
            mkdir -p $full_path
            touch $full_path/.gitkeep
            echo "Created directory: $target/$folder_name"

        case "todo"
            set -l todo (rg --column --line-number --no-heading --color=always --smart-case "- \[ \]" $notes_dir | fzf --ansi --delimiter : --preview 'bat --color=always --highlight-line {2} {1}')
            if test -n "$todo"
                set -l file (echo $todo | cut -d: -f1)
                set -l line (echo $todo | cut -d: -f2)
                nvim +$line $file
            end

        case "cap"
            if test (count $argv) -lt 2
                echo "Usage: brain cap <message>"; return 1
            end
            set -l date (date +%Y-%m-%d)
            echo "- [$date] $argv[2..-1]" >> "$notes_dir/capture.md"
            echo "Thought captured to $notes_dir/capture.md"

        case "sync"
            cd $notes_dir
            git add .
            set -l current_date (date +%Y-%m-%d)
            git commit -m "Brain update: $current_date"
            git push
            cd -

        case "random"
            set -l note (fd . $notes_dir --type f --extension md | shuf -n 1)
            test -n "$note"; and nvim $note

        case "dir" "tree"
            ezatree --level=2 --ignore-glob=".git|.gitignore|.gitkeep" $notes_dir

        case "-h" "--help"
            echo "Terminal Second Brain CLI"
            echo "--------------------------"
            echo "Usage: brain [command] [arguments]"
            echo ""
            echo "Commands:"
            echo "  new <title>      Create timestamped note in 00_Inbox"
            echo "  mkdir <t> <name> Create folder in (p)rojects, (a)reas, or (r)esources"
            echo "  search           Global search through all notes"
            echo "  todo             Find all active tasks"
            echo "  cap <msg>        Quickly append to capture.md"
            echo "  random           Open a random note"
            echo "  sync             Git sync all changes"
            echo "  dir/tree         Show directory structure"
            echo "  * (default)      Open Yazi"

        case "*"
            cd $notes_dir && yazi
    end
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

# ========================================================= Greeting
function fish_greeting
  # fastfetch
  #  echo "Welcome back, Adi! Let's make something beautiful >w<"
end
