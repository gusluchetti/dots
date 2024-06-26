#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    s_path=$1
else
    s_path=$(find ~/Github -name '.git' | xargs -I{} dirname {} | fzf --height 50% --reverse)
fi

if [[ -z $s_path ]]; then
    exit 0
fi

s_name=$(basename "$s_path" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $s_name -c $s_path
    exit 0
fi

if ! tmux has-session -t $s_name 2> /dev/null; then
    tmux new-session -ds $s_name -c $s_path
fi

if [[ -z $TMUX ]]; then
    tmux new-session -A -t $s_name
else
    tmux switch-client -t $s_name
fi

