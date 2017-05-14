#!/usr/bin/env bash

BUILD_DIR="docs/"

if [ -d "$BUILD_DIR" ]; then rm -Rf $BUILD_DIR; fi

make html
touch docs/.nojekyll

git add --all
git commit -m "build docs"
git push -f -u origin master