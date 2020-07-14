# script-cmd
ホームコマンド

- シンボリックリンク作成
  - よさげやったら、|bash
```
find $HOME/script-cmd -type f | grep -vP '\.git' | xargs file | grep executable | cut -d':' -f1 | sort -r | while read f;do CMD_HOST_VERSION=$(echo $f|grep -Po '[0-9]+?(-[0-9]+)+');echo ln -fsr $f $HOME/.local/script-cmd/bin/${f##*/};echo ln -fsr $f $HOME/.local/script-cmd/bin/${f##*/}-$CMD_HOST_VERSION;done
```

- パス通す


```
echo 'export SCRIPT_CMD_HOME=$HOME/.local/script-cmd' >>$HOME/.bashrc
echo 'export PATH=$SCRIPT_CMD_HOME/bin:$PATH'>>$HOME/.bashrc
```

- キャッシュ更新

```
source $HOME/.bashrc
```
