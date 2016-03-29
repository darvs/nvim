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

export TERM='xterm-256color'

#----------------------------------
# theme
#----------------------------------

source ~/.dotfiles/powerlevel9k/powerlevel9k.zsh-theme

#----------------------------------
# zgen
#----------------------------------

if [ -f ~/.zshrc.zgen ]; then
	source ~/.zshrc.zgen
fi

#----------------------------------
# autoenv
#----------------------------------

source `which activate.sh`

#----------------------------------
# ~/bin
#----------------------------------

if [ -d ~/bin ]; then
	PATH=$PATH:~/bin
fi

fi

#----------------------------------
# iTerm2 integration
#----------------------------------

if [ -f ~/.iterm2_shell_integration.zsh ]; then
	source ~/.iterm2_shell_integration.zsh
fi

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
	# echo works in bash & zsh
	local mode=$1 ; shift
	echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

# vim: ts=4
