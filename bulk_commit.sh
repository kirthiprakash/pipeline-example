#!/bin/bash

for i in {1..10}
do
  date=$(exec date)
  echo "$1 $date" > app/file.txt
  git commit -am "commit message: $date"
done
git push origin master
