#!/bin/bash

for i in {1..10}
do
  BRANCH="feature-$i"

  # go to main branch
  git checkout main
  git pull

  # create new branch
  git checkout -b $BRANCH

  # add change
  echo "$(date)" >> auto.txt

  git add auto.txt
  git commit -m "auto commit $i"

  # push branch
  git push -u origin $BRANCH

  # create PR
  gh pr create --title "Auto PR $i" --body "automation"

  # merge PR
  gh pr merge --merge --admin --delete-branch
done
