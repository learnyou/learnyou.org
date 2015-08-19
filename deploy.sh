#!/bin/sh

stack exec -- website rebuild
cd prod
git ls-files | xargs git rm
cp -rv ../_site/* .
git add .
git commit -m "$(date)"
git push -u origin master
cd ..
