# script-cmd

```
$ find $HOME/script-cmd -type f -name "mysearch-register-bash" -o -name "mycmd-register-bash" | bash
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
