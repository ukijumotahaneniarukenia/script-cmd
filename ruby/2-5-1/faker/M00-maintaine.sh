#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  PRE: cd /tmp && git clone https://github.com/faker-ruby/faker.git
   IN: bash ${0##.*/}
EOS

exit 0

}


cd /tmp

if [ ! -d faker ];then

  usage

fi

#ロケール抜く
find faker -type f | grep lib | grep locale | grep -v address | while read f;do grep -q address: $f;[ $? -eq 0 ]&&echo $f;done | ruby -F/ -anle 'puts $F[$F.size-1].sub(/\.yml/,"")'|sort |uniq| sed -r 's/\s+//g'  >L00-handle-locale.txt

#引数なしメソッド名リストの作成
find faker/doc -type f | grep md$ | while read f;do grep -Po '^Faker.*?(?= #=>)' $f;done | grep -v '(' | sed -r 's/\s+//g' | sort | uniq>L02-non-variable-arguments-method-name-list.txt

#引数なしメソッドコマンドのファイル名の作成
cat L02-non-variable-arguments-method-name-list.txt | tr '[:upper:]' '[:lower:]' | sed 's/::/-/g;s/\./-/;s/_/-/g' | sed -r 's/\s+//g' | sort | uniq >L01-non-variable-arguments-file-name-list.txt

#可変長引数メソッド名リストの作成
find faker/doc -type f | grep md$ | while read f;do grep -Po '^Faker.*?(?= #=>)' $f;done | grep '(' | sed -r 's/\s+//g' | sort | uniq >L04-variable-arguments-method-name-list.txt

#移動
ls L[0-9][0-9]* | xargs  -I@ mv @ $HOME/script-cmd/ruby/2-5-1/faker/

#移動
cd  $HOME/script-cmd/ruby/2-5-1/faker/

##コピー
cat L01-non-variable-arguments-file-name-list.txt | sed 's/$/-ruby/' | xargs -I@ cp T01-template @


#置換
paste L01-non-variable-arguments-file-name-list.txt L02-non-variable-arguments-method-name-list.txt | while read f p;do sed -i "s/TOBE_REPLACE/$p/" $f-ruby;done



#自作コマンドに登録
find $HOME/script-cmd -type f | grep -vP '\.git|[TML]([0-9][0-9])' | xargs file | grep -P 'executable|Ruby script'| cut -d':' -f1 | sort -r | while read f;do echo ln -fsr $f $HOME/.local/script-search/bin/${f##*/};done | bash
