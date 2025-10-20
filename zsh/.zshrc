# Path to your Oh My Zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
# Other Stuff
export PYTHON_VENV_NAME=".venv"
export PYTHON_AUTO_VRUN=true
export LANG=en_US.UTF-8
export EDITOR="nvim"
# cargo / rust
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
# uv
export PATH="/Users/zaloog/.local/bin:$PATH"
export PATH="/Users/zaloog/.cargo/bin:$PATH"
# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# ZSH_THEME="robbyrussell"
ZSH_THEME="amuse"
# ZSH_THEME="macovsky"


plugins=(
    git
    python
    virtualenv
    rust
)

source $ZSH/oh-my-zsh.sh


# Performance Improvements
# Add to your .zshrc to disable oh-my-zsh updates
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# Optimize autosuggestions
# Installed with brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Syntax Highlighting
# Installed with brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# move below source $ZSH/oh-my-zsh.sh to work inside of tmux
# https://github.com/zsh-users/zsh-autosuggestions/issues/471
bindkey '^j' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#2D5873,bg=#BFBA9F"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7BA696,italic"

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi


# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
jira() {
    if [ -n "$1" ]
    then
        pandoc "$1" --from markdown-auto_identifiers --to jira | pbcopy
        echo "converted $1 to jira format in clipboard"
    else
        echo "Please select a markdown file"
    fi
}
# create a named tmux session with `t <NAME>`
t() {
    if [ -n "$1" ]
    then
        tmux new -s "$1" -n "editor"
    else
        tmux new
    fi
}

# attach to named tmux session with `ta <NAME>`
ta() {
    if [ -n "$1" ]
    then
        tmux attach -t "$1"
    else
        tmux attach
    fi
}

alias vim="nvim"
alias ll="ls -lhfaG"

# git alias
alias gs="git status"
alias cm="git commit"
alias ga="git add ."

# tmux
alias tl="tmux ls"
# just
alias j="just"

alias weather="curl -s https://wttr.in/Cologne"
