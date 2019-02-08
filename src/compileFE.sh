set -eu

ROOT_PATH=$(cd $(dirname $0) && pwd)
OUT_DIR_NAME='build'
SRC_DIR_NAME='src'
OUT=$ROOT_PATH/$OUT_DIR_NAME
SRC=$ROOT_PATH/$SRC_DIR_NAME

function mkdirp(){
  DIR_PATH=$1
  if ! [[ -d $DIR_PATH ]]; then
    mkdir -p $DIR_PATH
  fi
}

if [[ ! -d "${OUT}" ]]; then
  mkdir $OUT
elif [[ "$(ls -A $OUT)" ]]; then
  rm -rf $OUT
  mkdirp $OUT
fi

find $SRC -type f | while read FILE;
do
  if [[ -f $FILE ]]; then
    FILENAME="${FILE##*/}"
    EXT="${FILENAME##*.}"

    if [[ $EXT == 'haml' ]]; then
      OUTPUT=$OUT/`echo $FILENAME | sed -e "s/$SRC_DIR_NAME/$OUT_DIR_NAME/" -e "s/\.$EXT//"`
      mkdirp $(dirname "${OUTPUT}")
      haml -q -E utf-8 --trace -t ugly --unix-newlines $FILE $OUTPUT

    elif [[ $EXT == 'coffee' ]]; then
      OUTPUT=`echo "${FILE}" | sed -e "s/$SRC_DIR_NAME/$OUT_DIR_NAME\/script/" -e "s/\.coffee/\.js/"`
      mkdirp $(dirname "${OUTPUT}")
      coffee --no-header -bcp $FILE | uglifyjs -mc -o $OUTPUT

    elif [[ $EXT == 'sass' ]]; then
      OUTPUT=`echo "${FILE}" | sed -e "s/$SRC_DIR_NAME/$OUT_DIR_NAME/" -e "s/\.\(sass\|scss\)//" -e "s/renderer\///"` 
      mkdirp $(dirname "${OUTPUT}")
      sass -t compressed --trace -E utf-8 --unix-newlines --sourcemap=none -C $FILE $OUTPUT
    fi

  fi
done
