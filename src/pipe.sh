#!/bin/bash

LINE="---"
echo ${LINE}

echo "[ > ]"
echo \# コマンドの出力を file へ上書きする
echo "command > file"
echo ${LINE}

echo "[ >> ]"
echo \# コマンドの出力を file へ追記する
echo "command >> file"
echo ${LINE}

echo "[ < ]"
echo \# ファイル内容をコマンドへ渡す
echo "command < file"
echo ${LINE}

echo "[ | ]"
echo \# コマンドの実行結果を、他のコマンドへ引き渡す
echo "command1 | command2 | command3 ... | commandN"
echo ${LINE}


echo \# ヒアドキュメント
echo "command<<STRING"
echo "内容..."
echo "STRING"
echo ${LINE}

exit 0