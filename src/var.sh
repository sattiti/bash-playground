#!/bin/bash

LINE="---"

echo "${LINE}"

# var
# = の前後に space, tab を入れることはできない。
p="string"
echo "変数を出力 :"
echo "${p}"
echo "${LINE}"


# 実行結果を変数にセット
today=`date +%F 2>&1`
echo "${today}"
echo "${LINE}"


# array
# ary[@]
ary=("1" "2" "3" "4" "5" "6" "apple" "banana" "carrot")
echo \$ary[index]
echo \$ary[0]=${ary[0]}
echo ${ary[@]}
echo "${LINE}"


# unset VAR
var1="hello"
echo "var1="${var1}
echo "va1 を unset しました。"
unset var1
if [ -n ${var1} ]; then
  echo "var1=null"
fi
echo "${LINE}"


# readonly 変数
# readonly VAR="value"
readonly var2="world"
echo "readonly :"
echo "var2=${var2}"
echo "${LINE}"


# 特殊変数
# $?
echo "[ \$? ]"
echo 最後に実行したコマンドの終了ステータス :
echo ${?}
echo "${LINE}"

# $!
echo "[ \$! ]"
echo シェルが最後に実行したパックグランドの pid :
echo ${!}
echo "${LINE}"

# $-
echo "[ \$- ]"
echo setコマンドを使って設定したフラグの一覧 :
echo ${-}
echo "${LINE}"

# $$
echo "[ \$\$ ]"
echo コマンド自身の pid :
echo ${$}
echo "${LINE}"

# $#
echo "[ \$# ]"
echo 引数の個数 :
echo ${#}
echo "${LINE}"

# $*
# 全引数リスト。
echo "[ \$* ]"
echo 全引数展開 :
echo ${*}
echo "${LINE}"

# $@
# 全引数リスト。
echo "[ \$@ ]"
echo 全引数展開 :
echo ${@}
echo "${LINE}"

# シェル自身のファイル名
echo "[ \$0 ]"
echo 自分自身のファイル名 : ${0}
echo "${LINE}"

# $1～$n
# シェルに与えられた引数の値。
echo [ \$1 ]
echo 引数1 :
echo ${1}
echo "${LINE}"

# $IFS (Internal Field Separator)
echo "[ \$IFS ]"
echo ${IFS}
echo "${LINE}"


echo 一般環境変数
echo [ \$PS1 ]
echo ${PS1}
echo "${LINE}"

echo [ \$PS2 ]
echo "${PS2}"
echo "${LINE}"

echo [ \$PATH ]
echo "${PATH}"
echo "${LINE}"

echo [ \$TZ ]
echo TimeZone
echo ${TZ}
echo ${LINE}

echo [ \$PWD ]
echo "${PWD}"
echo "${LINE}"

echo [ \$HOME ]
echo "${HOME}"
echo "${LINE}"


echo [ \$LINENO ]
echo 行番号
echo ${LINENO}
echo "${LINE}"
