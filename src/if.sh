#!/bin/sh

echo "# ---\n"

# if
# 条件の前後にはスペースを入れないと、エラーとなる

# 数値の比較
# -eq : ==
# -ne : !=
# -lt : <
# -gt : >
# -le : <=
# -ge : >=

# 文字列の比較
# =  : ==
# != : !=

# ファイルの比較
# -nt : newer then
# -ot : older then

# test コマンドによる比較
# test [options] [target] test は省略可
# 
# -z : str.length == 0        true
# -n : str.length >= 0        true
# -d : file.type == directory true
# -f : file.type == file      true
# -s : file size > 0          true
# -e : file.exist             true
# -r : file.readable          true
# -w : file.writeable         true
# -x : file.executeable       true

# and, or, not
# -a : and && と同じ
# -o : or || と同じ
# !  : not

num1=10
num2=20

echo "num1=${num1}, num2=${num2}\n"

if [ ${num1} -eq ${num2} ]
then
    echo "YES\n"
else
    echo "NO\n"
fi

echo "# ---\n"


# case
# case 値 in
#   パターン1 ) 処理1 ;;
#   パターン2 ) 処理2 ;;
#   パターン3 ) 処理3 ;;
#   パターンn ) 処理n ;;
# esac
