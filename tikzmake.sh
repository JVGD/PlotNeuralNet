#!/bin/bash
FILE=$1

# Logging
echo "Input file: $FILE"

# Getting file info
DIR=$(dirname $FILE)
FILENAME=$(basename $FILE)
NAME=${FILENAME%.*}
MYPWD=$(pwd)

# To file folder
cd $DIR
python3 $FILENAME > /dev/null 2>&1
pdflatex $NAME.tex > /dev/null 2>&1
rm *.aux *.log *.vscodeLog *.tex  > /dev/null 2>&1

# Back to where we were
cd $MYPWD

echo "Created file in: $DIR/$NAME.pdf"