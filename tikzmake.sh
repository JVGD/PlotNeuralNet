#!/bin/bash
FILE=$1
DIR=$(dirname $FILE)
FILENAME=$(basename $FILE)
NAME=${FILENAME%.*}
MYPWD=$(pwd)

# To file folder
cd $DIR
python3 $FILENAME
pdflatex $NAME.tex
rm *.aux *.log *.vscodeLog
rm *.tex

# Back to where we were
cd $MYPWD

echo ""
echo ""
echo "Created file in: $DIR/$NAME.pdf"

# if [[ "$OSTYPE" == "darwin"* ]]; then
#     open $1.pdf
# else
#     xdg-open $1.pdf
# fi
