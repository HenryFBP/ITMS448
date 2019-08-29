#!/usr/bin/env bash

WORK_DIR=out/LNI

# Surround a file's lines with <li> elements
function surround_with_li() {
  sed -i "s/^/\<li\>/;s/\$/\<\/li\>/" $1
}

function generate_history_file {
  echo "Saving command history to an HTML file."

  touch HISTORY.HTML

  # XML gods, forgive me for I have concatenated.

  # Get bash history and save to a file.
  cat ~/.bash_history >> HISTORY.HTML

  # Surround all lines with <li></li> tags.
  surround_with_li "HISTORY.HTML"

  # Prepend <html><body> to file
  sed -i '1s;^;\<html\>\<body\>\<h1\>Your command history:\<\/h1\>\<p\>Hi Prof, can I have extra credit for creating valid HTML?\<\/p\>;' HISTORY.HTML

  # Append </body></html> to file. Ew...
  echo "</body></html>" >> HISTORY.HTML

  #      RRR
  chmod 0444 HISTORY.HTML
}

echo "This script will perform all of the steps required by this homework requirement."

if [ -d $WORK_DIR ]; then
  echo "Deleting '$WORK_DIR/*'..."
  rm -r $WORK_DIR
fi

mkdir -p $WORK_DIR
mkdir $WORK_DIR/PROGRAM
mkdir $WORK_DIR/PROGRAM/PYTHON
mkdir $WORK_DIR/PROGRAM/C++

mkdir $WORK_DIR/SCRIPTS
mkdir $WORK_DIR/SCRIPTS/SHELL_BASH

mkdir $WORK_DIR/FILES

if hash tree 2>/dev/null; then
  echo "Created this dir tree:"
  tree $WORK_DIR
else
  echo "Run 'apt install tree' or 'yum install tree' to use the 'tree' command."
fi

pushd $WORK_DIR/FILES

  generate_history_file

popd
