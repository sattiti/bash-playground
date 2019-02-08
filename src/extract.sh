set -eu

# func
usage(){
  local cmdname=$(basename $0)
  cat <<- EOL
Usage:
$cmdname FILE_LIST ROOT_PATH OUTPUT.
EOL
  unset cmdname
  exit 1
}

# exit if FILE wasnt given.
if [ $# -ne 3 ]; then
  echo "wrong number of arguments. (expected 3)"
  usage
fi

if ! [[ -d "${3}" ]]; then
  mkdir $3
fi

OUTPUT=$(cd "${3}" && pwd)

if [[ -d "${2}" ]]; then
  SRC_FILE=$1
  ROOT_PATH=$(cd "${2}" && pwd)
else
  echo "No such file or directory."
fi

for f in $(cat $SRC_FILE)
do
  file="${ROOT_PATH}${f}"
  out="${OUTPUT}${f}"

  if [[ -f $file ]]; then
    if ! [[ -d $out ]]; then
      mkdir -p $(dirname $out)
    fi
    cp -vrf $file $out
    # echo $out
  fi
done
