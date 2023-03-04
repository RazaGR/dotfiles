#!/bin/bash

# this script will accept multiple arguments
# and take action , arguents are optional
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

if [ $1 = "d" ]; then
  tmux detach
elif [ $1 = "n" ]; then
  # if not $2 exit 
  if [ -z "$2" ]; then
    echo "No session id provided"
    exit 1
  fi
  tmux new -s $2
elif [ $1 = "k" ]; then
  if [ -z "$2" ]; then
    echo "No session id provided"
    exit 1
  fi
  tmux kill-session -t $2
elif [ $1 = "l" ]; then
  tmux ls
elif [ $1 = "a" ]; then
  if [ -z "$2" ]; then
    echo "No session index provided"
    exit 1
  fi
      sessions=($(tmux ls | awk -F ':' '{print $1}' | cut -c 1-))
      index=$2
        for i in "${!sessions[@]}"
          do
            if [[ $i -eq $index ]] || [[ "${sessions[i]}" == "$index" ]]; then
              tmux attach -t ${sessions[i]}
              exit 0
            fi
          done
        
elif [ $1 = "h" ]; then
  echo "Usage: t.sh [option] [session name]"
  echo "Options:"
  echo "  d: detach current session"
  echo "  n: create new session"
  echo "  k: kill session"
  echo "  l: list sessions"
  echo "  a: attach to session"
  echo "  h: help"
else
    echo "Invalid argument"
    exit 1
fi
