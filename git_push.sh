#!/bin/sh
path="$1"
repo_name="$2"

git init $path
git add --all
git commit -m "initial commit"
git branch -M main
git remote add origin $repo_name
git push -u origin main