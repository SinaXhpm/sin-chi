#!/usr/bin/env bash
prtred() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}

  name=sinchi
  if [[ -e $name-$i.sh ]] ; then
      i=1
      while [[ -e $name-$i.sh ]] ; do
          let i++
      done
      name=$name-$i
  fi
  mkdir ~/.telegram-bot/$name
  cp bot.lua  ~/.telegram-bot/$name/bot.lua
  #cat bot.lua >> "$name".lua
  sed -i 's/ID/'$i'/g' ~/.telegram-bot/$name/bot.lua
  echo "sinchi-"$i".sh Created !"
  echo  " #!/bin/bash 
  echo OK GO!
  read -p 'Phone number :'  -e input
  echo Start to Login $input
    ./tb -p $name --login --phone="'$input' >> "sinchi-"$i".sh"
  chmod +x "sinchi-"$i".sh"
./sinchi-$i.sh
  #  prtred "ربات با موفقیت ساخته شد برای اجرا از دستور زیر استفاده کنید :                                                          "