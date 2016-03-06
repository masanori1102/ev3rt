#!/bin/sh

# Remove old files and directories
rm -rf hrp2/sdk/workspace/html/

# Execute doxygen
doxygen workspace.Doxyfile

# Commit files
git add hrp2/sdk/workspace/html
git commit -am "#1 Update doxyfiles"

exit 0

