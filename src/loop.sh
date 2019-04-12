#!/bin/bash

ary=("a" "b" "c" "d" "v")

for item in ${ary[@]}
do
  echo ${item}
done

num=0
while [ ${num} -lt 10 ]
do
  echo ${num}
  num=`expr ${num} + 1`
done
