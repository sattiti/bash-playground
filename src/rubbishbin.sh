set -eu

echo "Entry the TARGET PATH:"
read DIST

# dist check
if ! [[ -e $DIST ]]; then
  echo "${DIST} not exist."
  echo "bye."
  exit 0
fi

echo "Replacing times: (Default: 25)"
read TIMES

# times setting
if [[ $TIMES -eq "" ]]; then
  TIMES=25
fi

echo "Do ${TIMES} times."
echo "replace..."

for f in `find $DIST`
do
  echo "FUCKOFF: ${f}"
  if [[ -f $f ]]; then
    shred -fvzu -n $TIMES $f
  fi
done

rm -rfv $DIST

exit 0
