#!/bin/bash

PS3='Select startup program by number: '
options=("bash" "zsh" "tmux" "polaris" "ws" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "bash")
            /bin/bash --login
            ;;
        "zsh")
            /usr/local/bin/zsh --login
            ;;
        "tmux")
            /usr/local/bin/tmux new -A -s main -n local
            ;;
        "polaris")
            /usr/local/bin/zsh --login -c "mosh polaris tmux -- new -A -s main"
            ;;
        "ws")
            /usr/local/bin/zsh --login -c "ssh ws -t 'tmux -- new -A -s main'"
            ;;
        "quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
