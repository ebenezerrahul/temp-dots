# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/var/lib/snapd/snap/bin:$PATH
export PATH=/home/ebenezerrahul/.cargo/bin:$PATH 
# export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git you-should-use zsh-syntax-highlighting web-search colored-man-pages command-not-found extract npm starship zsh-autosuggestions)


#setting up git with ssh

export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
source $ZSH/oh-my-zsh.sh

alias mv='mv -i' 
alias nnn='nnn -e'

echo -e -n "\x1b[\x35 q" # changes to blinking bar
export UUTFCPP_INCLUDE_DIR=/usr/include/utf8cpp
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.local/share/fzf/key-bindings.zsh
source ~/.local/share/fzf/completion.zsh

# Opt--preview-window=70%ions to fzf command
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="-i --height=70% --ansi"
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --colors=always --all --icons=always | head -400' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {} --line-range :500 {}' "$@" ;;
  esac
}

source ~/fzf-git.sh/fzf-git.sh


[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
alias nn='nnn -de'
alias ls='eza --icons=always --color=always --all --git'
export BAT_THEME=tokyonight_night
eval $(thefuck --alias)
# eval "$(ntfy shell-integration)"
# eval "$(atuin init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

bindkey '^y' autosuggest-accept
alias qr='qrencode -m 2 -t utf8 <<< "$1"'
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi
export NNN_PLUG='j:autojump;p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi
export NNN_TMPFILE=/tmp/.lastd
export NNN_TRASH=1
# export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'

# eval "$(direnv hook zsh)"
source ~/.dotfiles/lib/zsh-autoenv/autoenv.zsh

# Created by `pipx` on 2024-04-23 16:01:43
export PATH="$PATH:/home/ebenezerrahul/.local/bin"


eval "$(register-python-argcomplete pipx)"
autoload -U compinit && compinit

export EDITOR=nvim
eval "$(zoxide init zsh)"
tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }
eval "$(leetcode completions)"
alias cd=z
plugins=(auto-notify $plugins)
source "$HOME/.cargo/env"
alias j=z
# Install Ruby Gems to ~/gems
# Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"
alias v=nvim
define() { curl -s "dict://dict.org/d:$1" | grep -v '^[0-9]'; }
alias treeview=frangipann
bindkey -s "^X" '^Cclear -x^M'


[ -d "$HOME/.local/bin" ] &&
export PATH="$PATH:$HOME/.local/bin" 

if [ -n $(command -v brew) ]; then
    PREFIX="${HOME}/.local"
    export HOMEBREW_PREFIX="$PREFIX"
    export HOMEBREW_CELLAR="$PREFIX/Cellar"
    export HOMEBREW_REPOSITORY="$PREFIX/Homebrew"
    export HOMEBREW_CASK_OPTS='${HOME}/Applications'
    export PATH="$PREFIX/bin:$PREFIX/sbin${PATH+:$PATH}"
    export MANPATH="$PREFIX/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="$PREFIX/share/info:${INFOPATH:-}"
    # export HOMEBREW_NO_ANALYTICS=1
    # export HOMEBREW_NO_ENV_HINTS=1
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export _JAVA_OPTIONS="-Xms13g -Xmx13g"
