#!/bin/bash

for i in {1..2}
do
  date=$(exec date)
  echo $date > app/file.txt
  git commit -am "$date"
done
git push origin master
