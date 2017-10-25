#!/bin/bash
while true ; do
   killall tmux
   killall tb
for entr in sinchi-*.sh ; do
    entry="${entr/.sh/}"
    tmux new-session -d -s $entry "./tb -p "$entry" -s bot.lua"
  done
  echo 'On!'
sleep 250
done
