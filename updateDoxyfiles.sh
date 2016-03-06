#!/bin/sh

# Remove old files and directories
rm -rf hrp2/sdk/workspace/html/

# Execute doxygen
doxygen workspace.Doxyfile

exit 0

