#!/usr/bin/env bash

WORK_DIR=out/LNI

# Prepend text to a file.
function prepend_to_file() {
  echo "$1" | cat - $2 > /tmp/hellothere && mv /tmp/hellothere $2
}

# Surround a file's lines with <li> elements
function surround_with_li() {
  sed -i "s/^/\<li\>/;s/\$/\<\/li\>/" $1
}


# Append a closing HTML tag to a file.
function append_closing_tag() {
  echo "</$1>" >> $2
}

# Append an opening HTML tag to a file.
function append_opening_tag() {
  echo "<$1>" >> $2
}



function generate_systeminfo_file {
  echo "Saving system into to an HTML file."

  touch SYSTEMINFO.HTML

  cat /proc/cpuinfo >> SYSTEMINFO.HTML

  surround_with_li "SYSTEMINFO.HTML"

}

function generate_history_file {
  echo "Saving command history to an HTML file."

  touch HISTORY.HTML

  # XML gods, forgive me for I have concatenated.

  # Get bash history and save to a file.
  cat ~/.bash_history >> HISTORY.HTML

  # Surround all lines with <li></li> tags.
  surround_with_li "HISTORY.HTML"

  prepend_to_file \
  "<html><body><h1>Your command history:</h1><p>Hi Prof, give me extra credit for making valid HTML.</p>" \
  "HISTORY.HTML"

  # Append </body></html> to file. Ew...
  append_closing_tag "body" "HISTORY.HTML"
  append_closing_tag "html" "HISTORY.HTML"

  # Set the perm bits
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

  generate_systeminfo_file

popd
