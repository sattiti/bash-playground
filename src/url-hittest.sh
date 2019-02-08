#!/usr/bin/sh
set -eu

PROXY=""

echo "using proxy server?"
echo "[y]es | [n]o | [q]uit"

read CONFIRMATION
case $CONFIRMATION in
  'yes'  ) echo "proxy server:"; read PROXY ;;
  'y'    ) echo "proxy server:"; read PROXY ;;
  'n'    ) PROXY=""   ;;
  'no'   ) PROXY=""   ;;
  'q'    ) echo "bye."; exit 0 ;;
  'quit' ) echo "bye."; exit 0 ;;
  *) PROXY="" ;;
esac

OUTPUT=`dirname %0`/result.log

#USER=""
#PASSWD=""
#PROXY=""

if [[ $PROXY != "" ]]; then
  # user name
  echo "User name:"
  read USER

  # passwd
  echo "passwd:"
  read -s PASSWD

  if [[ $USER == "" ]] || [[ $PASSWD == "" ]]; then
    echo "username or passwd empty."
    echo "Bye."
    exit 0
  fi
fi

function hittest () {
  echo $1
  echo $1 >> $2
  if [[ $PROXY == "" ]]; then
    curl -LI $1 -w '%{http_code}\n' -s | grep -iE "HTTP/|Location|Status|^Connection\b" >> $2
  else
    curl -LI $1 -w '%{http_code}\n' -U "${USER}:${PASSWD}" -x $PROXY -s | grep -iE "HTTP/|Location|Status|^Connection\b" >> $2
  fi
  echo >> $2
}


# remove $OUTPUT
if [[ -e $OUTPUT ]]; then
  rm -rfv $OUTPUT
fi

if [[ -f $1 ]]; then
  cat "${1}" | while read line
  do
    hittest $line $OUTPUT
  done
else
   hittest $1 $OUTPUT
fi

clear
exit
