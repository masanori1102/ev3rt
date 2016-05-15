#!/usr/bin/env bash

# This script is for merging the selected branches

if [ $# -eq 0 ]; then
    echo "Illegal parameter" 1>&2
    echo "Enter branch name" 1>&2
    echo "The meaning of 1st parameter is based branch." 1>&2
    echo "The meaning of 2nd parameter is merge branch.(optional)" 1>&2
    exit 1
fi

# update branch to up-to-date.
./scripts/renew_branch.sh $1

if [ $# -ne 2 ]; then
    exit 0
fi

if [ $2 -eq "tasks/1" ]; then
    git merge $2 -m "Merge from /$2"
else
    git merge $2
fi

git push origin $1:$1

exit 0
