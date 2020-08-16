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
$ cat cmd-in-out.tsv | while read cmd in out ;do echo $cmdうんち$inうんち$out; echo $cmd/$cmd-ruby | xargs -I@ sed -n '25p' @|sed -r 's/^\s+/うんち/' | sed 's/ /うんこ/g'; done | xargs -n2|sed 's/うんこ/ /g' | sed -r 's/ ?うんち/\t/g' | sponge cmd-in-out.tsv
```

a.txtでシングルクォートをおぎなうなど

```
cat cmd-in-out.tsv | awk '{$1="";$2="";$3="";print$0}'|sed -r 's/^\s+//' > a.txt
```


2回目以降

cmd-in-out.tsvから自動生成

```

```
