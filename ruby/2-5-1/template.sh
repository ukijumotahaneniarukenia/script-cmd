#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
   IN: echo PrincessBride | ${0##*/}
  OUT:
EOS

exit 0

}

main(){
  ARGS=($(cat -));

  STR=${ARGS[0]}

  if [ -z "${STR}" ] ;then

    usage

  fi

  echo "${STR}" | ruby -F'(?=[A-Z])' -anle 'puts $F[0].downcase,$F[1..$F.size-1]'|tr -d \\\n|awk 4

}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || usage