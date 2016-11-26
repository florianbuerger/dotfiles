#!/bin/bash
if [[ $1 == "" ]]; then
    echo "Usage: $0 FILE_OR_DIR [remote]";
    echo "FILE_OR_DIR: the file or directory you want to remove from history"
    echo "if 'remote' argument is set, it will also push to remote repository."
    exit;
fi
FOLDERNAME_OR_FILENAME=$1;

#The important part starts here: ------------------------

git filter-branch -f --index-filter "git rm -rf --cached --ignore-unmatch $FOLDERNAME_OR_FILENAME" -- --all
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now

if [[ $2 == "remote" ]]; then
    git push --all --force
fi
echo "Done."
