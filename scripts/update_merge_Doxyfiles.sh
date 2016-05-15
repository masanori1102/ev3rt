#!/usr/bin/env bash
git fetch --prune origin
git config --global push.default upstream

# Remove `tasks/1` branch
./scripts/remove_branch.sh tasks/1

# Create `tasks/1` branch from `master`
./scripts/renew_branch.sh tasks/1 master

# Update docs
./scripts/updateDoxyfiles.sh Commit
git push origin tasks/1:tasks/1

# Merge branch into `master` from `tasks/1`
./scripts/merge_branch.sh master tasks/1

# Remove `tasks/1` branch
./scripts/remove_branch.sh tasks/1

# Merge all branches
./scripts/merge_all.sh

exit 0
