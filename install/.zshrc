# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR=nano

# Go Path
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Path
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/champii/.local/bin:$HOME/.cabal/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.bin:$HOME/.cargo/bin"

# Theme
ZSH_THEME="rkj-repos"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# OhMyZsh Plugins
plugins=(git extract cp nvm)

source $ZSH/oh-my-zsh.sh

# Aliases

# Exa
alias ls="exa --git"
alias l="ls -l"
alias la="l -a"
alias lt="l --tree"
alias lta="la --tree"
alias lg="l --grid"
alias lga="la --grid"

# Misc
alias am="alsamixer"
alias src="source ~/.zshrc"
alias please="sudo"

alias ps="procs"
alias cat="bat --theme GitHub"
alias find="fd"
alias howdoi="hors -c"

# Yay
alias yi="yay -S"
alias yu="yay -Syu"
alias ys="yay -Ss"
alias yr="yay -Rsc"

# Ping
alias ping="cping"
alias p="ping"
alias pg="ping google.fr"
alias p8="ping 8.8.8.8"

# Git
alias gco="git checkout"
alias gc="git commit -m"
alias gca="git commit -am"
alias ga="git commit --amend"
alias gaa="git commit -a --amend"
alias gs="git status"
alias clone="git clone"
alias pull="git pull origin `git rev-parse --abbrev-ref HEAD`"
alias push="git push origin `git rev-parse --abbrev-ref HEAD`"
alias pushf="git push -f origin `git rev-parse --abbrev-ref HEAD`"

# Screen
alias sdet="screen -d -m -S"
alias satt="screen -r"
alias sls="screen -ls"

# Emacs
alias emacs="emacsclient -create-frame -a \"\""
alias ne="emacs -nw"

# Glances
alias glances="glances --fs-free-space -1 --enable-process-extended --process-short-name -b"

# Lemonbar fonts
xset fp+ $HOME/.fonts/misc
xset fp+ $HOME/.fonts/ohsnap
xset fp+ $HOME/.fonts/terminesspowerline
source /usr/share/nvm/init-nvm.sh

export LLVMENV_RUST_BINDING=1
source <(llvmenv zsh)

# opam configuration
test -r /home/champii/.opam/opam-init/init.zsh && . /home/champii/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH=/home/champii/.local/bin:$PATH
