#!/bin/bash
while true ; do
   killall tmux
for entr in sinchi-*.sh ; do
    entry="${entr/.sh/}"
    tmux new-session -d -s $entry "./tb -p "$entry" -s bot.lua"
  done
  echo 'On!'
sleep 1080
done