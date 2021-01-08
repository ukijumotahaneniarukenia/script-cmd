# script-cmd

- ネイティブに近いgolangやnimなどのコンパイル言語はコピー

- JVM系の言語はjarの場合はシェルのラッピングし、リンクはる

- スクリプト言語などはリンクでおけ

インストール

```
$ find $HOME/script-cmd -type f -name "mycmd-install-bash" | bash
```

アンインストール

```
$ find $HOME/script-cmd -type f -name "mycmd-uninstall-bash" | bash
```


Usageいけてないとき

```
$ which tsv2json-jq
/home/aine/.local/script-cmd/bin/tsv2json-jq

$ readlink -f /home/elasticsearch/.local/script-cmd/bin/tsv2json-jq
/home/elasticsearch/script-cmd/jq/1-5/tsv2json-jq

$ vi /home/elasticsearch/script-cmd/jq/1-5/tsv2json-jq

$ cd /home/elasticsearch/script-cmd/

$ git add *

$ git commit -a -m "cmd"

$ git push -u origin master

$ cd -
```
