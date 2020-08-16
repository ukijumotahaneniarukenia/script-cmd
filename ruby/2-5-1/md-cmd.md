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
$ cat cmd-in-out.tsv | awk '{print $1,$2,$3}' OFS="\t" | while read cmd in out;do echo -e "$cmd\t$in\t$out"; sed -n 25p $cmd/$cmd-ruby|sed -r 's/echo\s+"\$\{STR\}"\s+\| //'|sed -r 's/^\s//g;s/^ //';done>cmd-in-out.txt
```

コマンド一覧の再生成
```
$ cat cmd-in-out.tsv | awk '{print $1}' | xargs -I@ grep -A1 -P ^@ cmd-in-out.txt|awk '{a+=NR%2}{b[a]=b[a]"\t"$0};END{for(e in b)print e,b[e]}'|sed 's/ \t/\t/'|sort -nk1|awk -v FS="\t" '{print $2,$3,$4,$5}' OFS="\t" | sponge cmd-in-out.tsv
```

2回目以降

cmd-in-out.tsvから自動生成

```

```
