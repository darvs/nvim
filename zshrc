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
    # autosuggestion should be loaded last
    #   and most of all after zsh-syntax-highlighting
    # zgen load tarruda/zsh-autosuggestions

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow
    zgen load bhilburn/powerlevel9k powerlevel9k.zsh-theme

    # save all to init script
    zgen save
fi

# # Enable autosuggestions automatically.
# zle-line-init() {
# 	zle autosuggest-start
# }
# zle -N zle-line-init

# vim: ts=4
