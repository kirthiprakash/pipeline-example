#!/bin/bash

for i in {1..1}
do
  date=$(exec date)
  echo "Index:$i; Date:$date" > app/file.txt
  git add -u
  git commit -m "commit message: $date"
done
git push origin master
