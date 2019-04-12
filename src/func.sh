#!/bin/bash

# function は省略可
# () は省略可
# function 関数名(){
#   処理
#   return 値
# }


say() {
  # local 変数
  # local VAR
  local a="world"
  echo "hello"
  echo ${a}
}

say