# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
alias c='clear'
alias vim='nvim'
alias vi='nvim'
alias g='git'
alias gs='git status'
alias ls='exa -l'
alias ll='exa -l'
alias la='exa -l -a'
set -x EDITOR nvim
set -x VISUAL nvim
fish_vi_key_bindings
alias '..'='cd ..'

neofetch

