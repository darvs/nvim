if [ -f ~/.zshrc.common ]; then
	source ~/.zshrc.common
fi

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
    zgen load bhilburn/powerlevel9k powerlevel9k.zsh-theme

    # save all to init script
    zgen save
fi

# vim: ts=4
