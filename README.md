# script-cmd
ホームコマンド

- シンボリックリンク作成

```
find $HOME/script-cmd -type f | grep -vP '\.git' | xargs file | grep executable | cut -d':' -f1 | while read f;do echo ln -fsr $f $HOME/.local/script-cmd/bin/${f##*/};done
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
