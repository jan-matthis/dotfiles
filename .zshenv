if ! { [ -n "$TMUX" ]; } then
    tmux -L main_session -f $HOME/.config/tmux/prefix_C-b.conf new -A -s main
fi
