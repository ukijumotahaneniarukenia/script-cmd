#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  KEYWORD_LIST: bidi block category code combining comment decimal decomposition digit lower mirrored name numeric script title unicode10 upper

   IN: $0 'CAT FACE'

  OUT:

   IN: $0 FACE

  OUT:

   IN: $0 block

  OUT:

   IN: $0 script

  OUT:

   IN: $0 name

  OUT:
EOS

exit 0

}

SEARCH_WORD="$1";shift;

if [ -z "$SEARCH_WORD" ];then

  usage

fi

time perl -MUnicode::UCD -C -E '$,="\t";($s,$e)=@ARGV;map{$n=$_;$c=sprintf("0x%X",$_);$a=Unicode::UCD::charinfo(sprintf("0x%X",$_));map {say $n,$c,chr($n),$_,%{$a}{$_}} sort keys %{$a} if(($_<55296 or $_>57343) and $_>190)}($s..$e);' 0 1114109 | grep "${SEARCH_WORD}"
