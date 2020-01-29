#!/usr/bin/env bash

set -ue

while read line then
do
  shasum -a 256 $line
done < <(fdupes -fr $1 | sort | uniq | grep -v '^$')