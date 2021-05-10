#!/bin/sh

set -e # fail fast
set -x # print commands

git clone resource-gist updated-gist

cd updated-gist
date > bumpme

git config --global user.email "stage-job@nobody.org"
git config --global user.name "stage-job"

git add .
git commit -m "Bumped date"
