# Basic cmd {{{
# awk {OPTIONS} {FILE}
# awk {OPTIONS} '{AWK_SCRIPT}' {FILE}

# options:
# -F FIELD_SEPARATOR  define input field separator by extended regex
# -f SCRIPT_FILE      read program file
# -v VAR=VALUE        assign values to variables
# }}}
# Basic awk program structure {{{
# BEGIN { ... }
# CONDITION { DO ACTION ON LINES MATCHING CONDITION }
# CONDITION { DO ACTION ON LINES MATCHING CONDITION }
# END { ... }
# }}}
# Special Variables {{{
# $0  the whole line.
# $1  the first field.
# $2  the second filed.
# $n  the nth field.

# CONVFMT                              数値から文字列に変換する際に awk が使用するもの。
#                                      この変数は参照されたときに、sprintfの第一引数である
#                                      ような効果を持つ。デフォルトでは "%.6g" 
# FIELDWIDTHS="F1_WIDTH F2_WIDTH ..."  Specifies the Field Width.
# FS=FIELD_SEPARATOR                   Specifies the Feild Separator.
# IGNORECASE                           charater case を無視する。
# OFMT                                 数値を文字列に変換するときの動作を制御するのに使用
#                                      するもの。デフォルトでは "%.6g"
# OFS=OUTPUT_FIELD_SEPARATOR           Specifies the Output Filed Separator. By Default,
#                                      OFS is space.
# ORS=OUTPUT_RECORD_SEPARATOR          Specifies the Output Record Separator.
# RS                                   レコードセパレータ。
# SUBSEP                               添字を区切るものであり、デフォルト値は "\034" である
#
# ARGC                                 コマンドラインで渡されたパラメータの合計数。
# ARGV                                 子マンラインのパラメータ。
# ARGIND                               現在処理を行っているファイルのAEGVにおけるインデックス。
# ENVIRON                              環境変数(配列) ex: EXVIRON["PATH"]。
# ERRNO                                getlineのリダイレクト、読み込み、 closeでシステムエラー
#                                      が発生したときに表わす。
#                                      文字列がセットされる。
# FILENAME                             処理中のファイル名。
# FNR                                  処理中のレコード。
# NF                                   Number of Fields in a line.
# NR                                   Line Number.
# RLENGTH                              match 関数でマッチした部分文字列の長さ。
# RSTART                               match 関数でマッチした部分文字列の最初のキャラクタの
#                                      インデックス。
# RT                                   レコードが読み込まれるたびにセットされる。
# }}}
# Array {{{
# 要素削除
# delete ARRAY
# delete ARRAY[INX]
# }}}
# Built-in Function {{{
# Math
# atan2(x, y)
# cos(x)
# exp(x)
# log(x)
# sin(x)
# sqrt(x)

# int(n)

# rand()
# srand([n])

# String
# gsub(regex, replacement, [, target])
# sub(regex, replacement, [, target])
# gensub(regexp, replacement, how[, target])  元の文字列を変更しない。
# substr(str, index, [, len])

# index(str, find)
# length()

# match(str, regex)
# split(str, arr, [, regex])

# tolower(str)
# toupper(str)

# print(expr)
# printf(fmt, expr-list)
# sprintf(fmt, expr-list)

# I/O
# close(filename)
# fflush([filename])

# system(cmd)
# systime()
# strftime([fmt, [, timestamp]])
# }}}
# getline {{{
# getline                $0, NF, FNR, NRをセットする。 
# getline var            var, FNR, NRをセットする。 
# getline < file         $0, NFをセットする。 
# getline var < file     varをセットする。 
# command | getline      $0, NFをセットする。 
# command | getline var  varをセットする。 

# example:
# awk '{
#   if (NF == 2 && $1 == "@include") {
#     while ((getline line < $2) > 0)
#       print line
#       close($2)
#   } else
#     print
#   }'
# }}}
# Defined function{{{
# function a(){
#   printf "Hello %s\n", $1;
# }
# }}}
# if{{{
# ls | awk '{if(length($1) <= 5) {print $1}else{print "NOTHING."}}'
# }}}
# for{{{
# {for(i=0; i<10; i++){print i;}}
# {for(e in ENVIRON){print e;}}

# break
# continue
# next
# exit 1
#}}}
# while{{{
# BEGIN {i=10;}
# {while(i<10){print i; i++;}}
# }}}
# printf{{{
# %c  Prints numeric as a string.
# %d  Prints an integer value.
# %e  Prints scientific numbers.
# %f  Prints float values.
# %o  Prints an octal value.
# %s  Prints a text string.
# awk {printf "hello %s\n", "world"}
# }}}
# Pattern matching {{{
# awk '/[A-Za-z0-9]+' { print "Matched." }
# }}}
# Example {{{
# Example1:
# awk '{print "Hello World"}'

# Example2:
# $0=Hello Peter
# $1=Hello
# $2=Peter
# echo "Hello Peter" | awk '{$2="Mary"; print $0}'

# Example3:
# Uniq array
# _ は変数名、勝手に作られてる？
# awk のデフォルトでは、自動的に print $0 を返すらしい？
# awk '!_[$0]++' ./FILE
# }}}
