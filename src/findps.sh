set -eu

# func
usage(){
  local cmdname=$(basename $0)
  cat <<- EOL
Usage:
$cmdname [-l LOG_OUTPUT_PATH] [-h] PSD_FOLDER_PATH KEYWORD

Options:
-l log  Print out the result.
-h help Show this message.
EOL
  unset cmdname
  exit 1
}


LOG=""
while getopts :l:h OPT
do
  case $OPT in
    l) LOG=$OPTARG ;;
    h) usage ;;
    *) usage ;;
  esac
done

# Fuck the given options off.
shift $(($OPTIND - 1))

# exit if FILE wasnt given.
if ! [ $# -eq 2 ]; then
  echo "wrong number of arguments. (expected 2)"
  usage
fi

# remove file if exist.
if [ -r $LOG ]; then
  rm -rf $LOG
fi


RES_DIST=$1
PATTERN=$2
num=0


# exit when PSD_FOLDER not exist.
if ! [[ -d "$RES_DIST" ]]; then
  echo "${RES_DIST} No such file or directory."
  exit
fi


while read LINE
do
  RESULT=$(cat $LINE | grep -Ei -a "<photoshop:Layer(Text|Name)" | grep -E -a "${PATTERN}")
  if [[ $RESULT ]]; then
    num=$((num + 1))
    echo "[${num}] ${LINE}"

    if [[ ${#LOG} -gt 0 ]]; then
      echo $LINE >> $LOG
    fi
  fi
done < <(find "${RES_DIST}" -type f -print | grep -Ei "*.psd")

echo "${num} found".
