if [ "$TERM" != "screen" -a -z "$TMUX" ]; then
  tmux ls | cut -d: -f1 | grep -q main && tmux attach -t main || tmux new-session -s main
fi
