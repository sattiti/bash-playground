set -eu

CURT=$(cd $(dirname ${0}) && pwd)

echo ${CURT}
echo ${#CURT}         # length

# remove prefix.
echo ${CURT##*/}      # remove prefix greedily
echo ${CURT#*/}       # remove prefix reluctantly

# remove suffix.
echo ${CURT%%*/}      # remove suffix greedily
echo ${CURT%*/}       # remove suffix reluctantly

# substitution.
TXT="txt.txt.txt"
echo ${TXT/txt/text}  # single substitution.
echo ${TXT//txt/text} # global substitution.
echo ${TXT/#txt/text} # prefix substitution.
echo ${TXT/%txt/text} # suffix substitution.

# upper|lower case
# echo ${CURT^^}      # uppercase
# echo ${CURT^}       # uppercase first letter
# echo ${CURT,,}      # lowercase
# echo ${CURT,}       # lowercase first letter
# echo ${CURT~~}      # reverse case
# echo ${CURT~}       # reverse case first letter

exit 0
