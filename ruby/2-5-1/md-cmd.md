```
echo {downcamel,unkoMoriMori,upcamel,UnkoMoriMori,snake,unko_mori_mori,screamsnake,UNKO_MORI_MORI,kebab,unko-mori-mori,train,Unko-Mori-Mori} | xargs -n1 | xargs -n2

echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ mkdir -p @
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ echo cp template.sh @/ | bash
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ echo mv @/template.sh @/@-ruby | bash


$ echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|while read in out;do cat master-list.txt | awk -v IN=$in -v OUT=$out '$1==IN{print $2};$1==OUT{print $2}';done | xargs -n2
unkoMoriMori UnkoMoriMori
unkoMoriMori unko_mori_mori
unkoMoriMori UNKO_MORI_MORI
unkoMoriMori unko-mori-mori
unkoMoriMori Unko-Mori-Mori
unkoMoriMori UnkoMoriMori
UnkoMoriMori unko_mori_mori
UnkoMoriMori UNKO_MORI_MORI
UnkoMoriMori unko-mori-mori
UnkoMoriMori Unko-Mori-Mori
unkoMoriMori unko_mori_mori
UnkoMoriMori unko_mori_mori
unko_mori_mori UNKO_MORI_MORI
unko_mori_mori unko-mori-mori
unko_mori_mori Unko-Mori-Mori
unkoMoriMori UNKO_MORI_MORI
UnkoMoriMori UNKO_MORI_MORI
unko_mori_mori UNKO_MORI_MORI
UNKO_MORI_MORI unko-mori-mori
UNKO_MORI_MORI Unko-Mori-Mori
unkoMoriMori unko-mori-mori
UnkoMoriMori unko-mori-mori
unko_mori_mori unko-mori-mori
UNKO_MORI_MORI unko-mori-mori
unko-mori-mori Unko-Mori-Mori
unkoMoriMori Unko-Mori-Mori
UnkoMoriMori Unko-Mori-Mori
unko_mori_mori Unko-Mori-Mori
UNKO_MORI_MORI Unko-Mori-Mori
unko-mori-mori Unko-Mori-Mori

```
