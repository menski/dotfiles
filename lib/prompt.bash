# configure git prompt
GIT_PS1_SHOWDIRTYSTATE="Y"
GIT_PS1_SHOWSTASHSTATE="Y"
GIT_PS1_SHOWUNTRACKEDFILES="Y"
GIT_PS1_SHOWUPSTREAM="auto"

DEFAULT_USER=menski

function ps_root {
  if [ $EUID -eq 0 ]; then
    echo \\u
  fi
}

function ps_user {
  if [ -z "$(ps_root)" -a "$USER" != "$DEFAULT_USER" ]; then
    echo \\u
  fi
}

function ps_host {
  if [ -z "$TMUX" -a "$TERM" != "screen" ]; then
    echo \\h
  fi
}

function ps_error {
  local rc=$?
  if [ $rc -ne 0 ]; then
    echo "$rc "
  fi
}

function ps_delim1 {
  if [ -n "$(ps_root)" -o -n "$(ps_user)" ]; then
    if [ -n "$(ps_host)" ]; then
      echo "@"
    else
      echo ":"
    fi
  fi
}

function ps_delim2 {
  if [ -n "$(ps_host)" ]; then
    echo ":"
  fi
}

PS1="\[\e[;31m\]\$(ps_error)$(ps_root)\[\e[m\]$(ps_user)$(ps_delim1)$(ps_host)$(ps_delim2)\W\$(__git_ps1 \" (%s)\") $ "
PS2="> "
PS3="> "
PS4="+ "
