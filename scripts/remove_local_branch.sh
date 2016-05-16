#!/usr/bin/env bash

# This script is for removing the selected branch from local repogitories.

if [ $# -eq 0 ]; then
    echo "Illegal parameter" 1>&2
    echo "Enter branch name" 1>&2
    exit 1
fi

# Remove the selected branch from local repository.
git branch -D $1

exit 0
