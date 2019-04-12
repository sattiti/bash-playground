#!/bin/sh

a=2
b=3

echo "a=${a}, b=${b}\n"
echo "a + b =" `expr ${a} + ${b}`
echo "a - b =" `expr ${a} - ${b}`
echo "a * b =" `expr ${a} \* ${b}`
echo "a / b =" `expr ${a} / ${b}`
