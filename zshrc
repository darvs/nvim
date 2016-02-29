# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit

#
# darvs: On OSX because zsh is installed by homebrew
# compinit will complain that some of its directories
# are insecure while sudoing as root.
#
if [[ "$OSTYPE" =~ darwin ]]; then
	compinit -u
else
	compinit
fi



# End of lines added by compinstall

#----------------------------------
# theme
#----------------------------------

source ~/.dotfiles/powerlevel9k/powerlevel9k.zsh-theme

#----------------------------------
# autoenv
#----------------------------------

source `which activate.sh`

#----------------------------------
# zgen
#----------------------------------

if [ -f ~/.zshrc.zgen ]; then
	source ~/.zshrc.zgen
fi

# vim: ts=4
