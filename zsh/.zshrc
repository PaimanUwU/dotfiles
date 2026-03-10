# ========================================================= Alias
alias sourcezsh='source ~/.zshrc'
alias code='codium'
alias cat='bat'
alias h='cd ~'
alias c='clear'
alias ls='eza --color=always --long --git --icons=always --no-time --no-user --no-permissions --no-filesize'
alias lt='eza --color=always --long --git --icons=always --no-time --no-user --no-permissions --no-filesize --tree --level=1 --sort=extension --group-directories-first --all -I ".git"'

alias cheats='glow ~/Documents/Dotfiles/Cheatsheets.md'

alias fzf="fzf --style full --preview 'fzf-preview.sh {}' --color 'preview-border:#9999cc,preview-label:#ccccff' --color 'list-border:#9999cc,list-label:#99cc99' --color 'input-border:#669966,input-label:#ffcccc' --color 'header-border:#996666,header-label:#99ccff'"
alias -g "**"="\$(fzf)"

# --- New Productivity Aliases ---

# Git Simplified
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Navigation & Essentials
alias ..='cd ..'
alias ...='cd ../..'
alias md='mkdir -p'
alias rd='rm -rf' # Use with caution!

# Development Tools
alias phpv='php -v'
alias comp='composer'
alias cu='composer update'
alias ci='composer install'
alias n='npm'
alias ni='npm install'
alias nr='npm run'

# Utility
alias path='echo $PATH | tr ":" "\n"' # View PATH line by line
alias myip='curl -s https://ifconfig.me && echo' # Get public IP
alias ezconfig='code ~/.zshrc' # Quick edit this file

# ======================================================== Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"



# ======================================================== ZSH
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# History
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no



# ======================================================== Ide prompt
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Added by Windsurf
export PATH="/Users/adiaimanputra/.codeium/windsurf/bin:$PATH"

# Added by Antigravity
export PATH="/Users/adiaimanputra/.antigravity/antigravity/bin:$PATH"



# ======================================================== Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export PATH="/Users/adiaimanputra/.config/herd-lite/bin:$PATH"




# ======================================================== Composer
export PHP_INI_SCAN_DIR="/Users/adiaimanputra/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$PATH:$HOME/.composer/vendor/bin"




# ======================================================== TheFuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)






# ======================================================== Zoxide
eval "$(zoxide init --cmd cd zsh)"

