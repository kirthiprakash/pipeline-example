#!/bin/bash

for i in {1..10}
do
  date=$(exec date)
  echo "$1 $date" > app/file.txt
  git add -u
  git commit -m "commit message: $date"
done
git push origin master
