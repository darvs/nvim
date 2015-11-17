# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/darvs/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ZGEN_RESET_ON_CHANGE=(~/.zshrc.local ~/.zshrc)

# load zgen
source ~/.dotfiles/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow
    zgen load bhilburn/powerlevel9k powerlevel9k.zsh-theme

    # save all to init script
    zgen save
fi

