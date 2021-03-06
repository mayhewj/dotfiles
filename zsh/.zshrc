#
# Completion
#
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#
# History
#
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=100000

#
# Aliases, environment variables, etc.
#
bindkey -e

alias vi=vim

export EDITOR=vim
export MANWIDTH=80

#
# Prompt
#
autoload -Uz vcs_info

setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats       '[%F{red}%b%f] '
zstyle ':vcs_info:*' actionformats '[%F{red}%b%f] [%F{yellow}%a%f] '

precmd() {
  vcs_info
  print -Pn "\e]0;%n@%m: %~\a"
}

PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}%# '

#
# OS-specific configuration
#
case `uname -s` in
  Darwin)
    alias ls='ls -F'
    export CLICOLOR=1
    ;;
  Linux)
    alias ls='ls --color=auto --classify'
    alias open=xdg-open
    ;;
esac

#
# Source machine-specific configuration from another file
#
[[ -f ~/.config/env.zsh ]] && source ~/.config/env.zsh
