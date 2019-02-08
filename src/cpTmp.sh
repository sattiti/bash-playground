set -eu

echo "temporary file:"
read TMP

echo "read file:"
read FILE

EXT=".xlsm"


TMP_FILE=$(cd $(dirname "${0}") && pwd)/"${TMP}"

if [[ -f $FILE ]]; then
  cat $FILE | while read LINE;
  do
    cp $TMP_FILE ./"${LINE}"$EXT
  done
else
  echo "${FILE} not exist."
  echo bye.
fi

exit 0
