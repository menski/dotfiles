autoload -U promptinit
promptinit

autoload -U colors
colors

# enable expansion for prompt
setopt PROMPT_SUBST

# configure git prompt
GIT_PS1_SHOWDIRTYSTATE="Y"
GIT_PS1_SHOWSTASHSTATE="Y"
GIT_PS1_SHOWUNTRACKEDFILES="Y"
GIT_PS1_SHOWUPSTREAM="auto"

DEFAULT_USER=menski
PROMPT_USER=$(if [[ ${EUID} == 0 ]]; then echo "%{$fg[red]%}%n%{$reset_color%}:"; elif [ "$USER" != "$DEFAULT_USER" ]; then echo '%n:'; fi)
PROMPT_GIT="\$(__git_ps1 \" (%s)\")"
export PROMPT="${PROMPT_USER}%c${PROMPT_GIT} %(?..%{$fg[red]%}%?%{$reset_color%} )$ "
