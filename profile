export EDITOR=vim
export PAGER=less
export BROWSER=/usr/bin/chromium

# local bin directory
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# python startup script
if [ -r "$HOME/.pystartup" ]; then
  export PYTHONSTARTUP="$HOME/.pystartup"
fi

# start keychain for ssh
if type keychain > /dev/null 2> /dev/null; then
  eval `keychain -Q -q --nogui --agents gpg,ssh --eval`
fi

# start X for tty1
if [ -r "$HOME/.xinitrc" -a "$(tty)" == "/dev/tty1" ]; then
  startx
  logout
fi
