set -eu

function curtplatform {
  UNAME=$(uname | tr '[:upper:]' '[:lower:]')
  if [[ ${UNAME} =~ 'darwin' ]]; then
    OS='mac'
  elif [[ ${UNAME} =~ 'linux' ]]; then
    OS='linux'
  elif [[ ${UNAME} =~ 'mingw32_nt' ]]; then
    OS='cygwin'
  else
    OS='unknown'
  fi
  echo ${OS}
}

curtplatform
exit 0
