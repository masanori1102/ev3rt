#!/bin/sh

# Remove old files and directories
rm -rf hrp2/sdk/workspace/html/

# Execute doxygen
doxygen workspace.Doxyfile

echo "$1"

if [ "${1}" = "Commit" ]
then
  # Commit files
  git add hrp2/sdk/workspace/html
  git commit -am "#1 Update doxyfiles"
fi

exit 0

