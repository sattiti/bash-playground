set -eu

TARGET=$(pwd)

find $TARGET/201[0-9] -type d | while read LINE;
do
  if [[ $LINE =~ \([0-9]+\)_\([0-9]+\) ]]; then
    mv $LINE "$(dirname $LINE)/${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
  fi
done

exit 0
