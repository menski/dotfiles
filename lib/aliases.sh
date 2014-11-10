# modified
alias grep='grep --color=auto'
alias ls='ls --color=never -F'

# shortcut
alias x='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias psgrep='ps aux | grep -v grep | grep -i'
alias o='xdg-open'
alias qmv='qmv --format=do'
alias jdk6='sudo archlinux-java set java-6-jdk'
alias jdk7='sudo archlinux-java set java-7-jdk'
alias jdk8='sudo archlinux-java set java-8-jdk'

# ls
alias l='ls -lh'
alias la='ls -lhA'
alias ll='ls -l'
alias lla='ls -lA'
alias lx='ll -BXh'  # sort by extension
alias lxx='ll -BX'
alias lz='ll -rSh'  # sort by size
alias lzz='ll -rS'
alias lt='ll -rth'  # sort by date
alias ltt='ll -rt'

# safety features
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'  # 'rm -i' prompts for every file
alias ln='ln -iv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
