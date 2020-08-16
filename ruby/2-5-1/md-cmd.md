一覧作成
```
echo {downcamel,unkoMoriMori,upcamel,UnkoMoriMori,snake,unko_mori_mori,screamsnake,UNKO_MORI_MORI,kebab,unko-mori-mori,train,Unko-Mori-Mori} | xargs -n1 | xargs -n2
```

ディレクトリ作成
```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ mkdir -p @
```

テンプレートの配備
```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ echo cp template.sh @/ | bash
```

リネーム

```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ echo mv @/template.sh @/@-ruby | bash
```

IN-OUTの作成
```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|while read in out;do echo $in"2"$out;cat master-list.txt| grep ^$in|awk '$0=$2';cat master-list.txt| grep ^$out|awk '$0=$2';done |xargs -n3 | tr ' ' '\t'>cmd-in-out.tsv
```


Usageのメンテ
```
cat cmd-in-out.tsv | while read cmd in out;do sed "s/INPUT_STR/$in/g;s/OUTPUT_STR/$out/g;" template.sh >$cmd/$cmd-ruby;done
```


チェックリストの作成
```
$ cat cmd-in-out.tsv  | awk '$0=$1' | xargs -I@ echo - [ ] @
- [ ] downcamel2upcamel
- [ ] downcamel2snake
- [ ] downcamel2screamsnake
- [ ] downcamel2kebab
- [ ] downcamel2train
- [ ] upcamel2downcamel
- [ ] upcamel2snake
- [ ] upcamel2screamsnake
- [ ] upcamel2kebab
- [ ] upcamel2train
- [ ] snake2downcamel
- [ ] snake2upcamel
- [ ] snake2screamsnake
- [ ] snake2kebab
- [ ] snake2train
- [ ] screamsnake2downcamel
- [ ] screamsnake2upcamel
- [ ] screamsnake2snake
- [ ] screamsnake2kebab
- [ ] screamsnake2train
- [ ] kebab2downcamel
- [ ] kebab2upcamel
- [ ] kebab2snake
- [ ] kebab2screamsnake
- [ ] kebab2train
- [ ] train2downcamel
- [ ] train2upcamel
- [ ] train2snake
- [ ] train2screamsnake
- [ ] train2kebab

```


コマンドの抽出
```
$ cat cmd-in-out.tsv | awk '{print $1,$2,$3}' OFS="\t" | while read cmd in out;do echo $cmd $in $out; sed -n 25p $cmd/$cmd-ruby|sed -r 's/echo\s+"\$\{STR\}"\s+\| //'|sed -r 's/^\s//g;s/^ //';done
downcamel2upcamel unkoMoriMori UnkoMoriMori
ruby -F'(?=[A-Z])' -anle 'print $F[0].capitalize,$F[1..$F.size-1].join("")'
downcamel2snake unkoMoriMori unko_mori_mori
ruby -F'(?=[A-Z])' -anle 'puts $F.map(&:downcase).join("_")'
downcamel2screamsnake unkoMoriMori UNKO_MORI_MORI
ruby -F'(?=[A-Z])' -anle 'puts $F.map(&:upcase).join("_")'
downcamel2kebab unkoMoriMori unko-mori-mori
ruby -F'(?=[A-Z])' -anle 'puts $F.map(&:downcase).join("-")'
downcamel2train unkoMoriMori Unko-Mori-Mori
ruby -F'(?=[A-Z])' -anle 'print $F[0].capitalize+"-"+$F[1..$F.size-1].join("-")'
upcamel2downcamel UnkoMoriMori unkoMoriMori
ruby -F'(?=[A-Z])' -anle 'print $F[0].downcase,$F[1..$F.size-1].join("")'
upcamel2snake UnkoMoriMori unko_mori_mori
ruby -F'(?=[A-Z])' -anle 'print $F.map(&:downcase).join("_")'
upcamel2screamsnake UnkoMoriMori UNKO_MORI_MORI
ruby -F'(?=[A-Z])' -anle 'print $F.map(&:upcase).join("_")'
upcamel2kebab UnkoMoriMori unko-mori-mori
ruby -F'(?=[A-Z])' -anle 'print $F.map(&:downcase).join("-")'
upcamel2train UnkoMoriMori Unko-Mori-Mori
ruby -F'(?=[A-Z])' -anle 'print $F.join("-")'
snake2downcamel unko_mori_mori unkoMoriMori
ruby -F_ -anle 'print $F[0],$F[1..$F.size-1].map(&:capitalize).join("")'
snake2upcamel unko_mori_mori UnkoMoriMori
ruby -F_ -anle 'print $F.map(&:capitalize).join("")'
snake2screamsnake unko_mori_mori UNKO_MORI_MORI
ruby -F_ -anle 'print $F.map(&:upcase).join("_")'
snake2kebab unko_mori_mori unko-mori-mori
ruby -F_ -anle 'print $F.join("-")'
snake2train unko_mori_mori Unko-Mori-Mori
ruby -F_ -anle 'print $F.map(&:capitalize).join("-")'
screamsnake2downcamel UNKO_MORI_MORI unkoMoriMori
ruby -F_ -anle 'print $F[0].downcase,$F[1..$F.size-1].map{|e|e.slice(0)+e.slice(1..e.size).downcase}.join("")'
screamsnake2upcamel UNKO_MORI_MORI UnkoMoriMori
ruby -F_ -anle 'print $F.map{|e|e.slice(0)+e.slice(1..e.size).downcase}.join("")'
screamsnake2snake UNKO_MORI_MORI unko_mori_mori
ruby -F_ -anle 'print $F.map(&:downcase).join("_")'
screamsnake2kebab UNKO_MORI_MORI unko-mori-mori
ruby -F_ -anle 'print $F.map(&:downcase).join("-")'
screamsnake2train UNKO_MORI_MORI Unko-Mori-Mori
ruby -F_ -anle 'print $F.map{|e|e.slice(0)+e.slice(1..e.size).downcase}.join("-")'
kebab2downcamel unko-mori-mori unkoMoriMori
ruby -F- -anle 'print $F[0],$F[1..$F.size-1].map(&:capitalize).join("")'
kebab2upcamel unko-mori-mori UnkoMoriMori
ruby -F- -anle 'print $F.map(&:capitalize).join("")'
kebab2snake unko-mori-mori unko_mori_mori
ruby -F- -anle 'print $F.join("_")'
kebab2screamsnake unko-mori-mori UNKO_MORI_MORI
ruby -F- -anle 'print $F.map(&:upcase).join("_")'
kebab2train unko-mori-mori Unko-Mori-Mori
ruby -F- -anle 'print $F.map{|e|e.slice(0).upcase+e.slice(1..e.size-1).downcase}.join("-")'
train2downcamel Unko-Mori-Mori unkoMoriMori
ruby -F- -anle 'print $F[0].downcase,$F[1..$F.size-1].join("")'
train2upcamel Unko-Mori-Mori UnkoMoriMori
ruby -F- -anle 'print $F.join("")'
train2snake Unko-Mori-Mori unko_mori_mori
ruby -F- -anle 'print $F.map(&:downcase).join("_")'
train2screamsnake Unko-Mori-Mori UNKO_MORI_MORI
ruby -F- -anle 'print $F.map(&:upcase).join("_")'
train2kebab Unko-Mori-Mori unko-mori-mori
ruby -F- -anle 'print $F.map(&:downcase).join("-")'
```

2回目以降

cmd-in-out.tsvから自動生成

```

```
