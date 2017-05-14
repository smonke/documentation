#!/usr/bin/env bash
# build the docs
cd docs
make clean
make html
# commit and push
git add -A
git commit -m "building and pushing docs"
git push origin master
# switch branches and pull the data we want
sleep 30
git checkout gh-pages
sleep 40
rm -rf .
touch .nojekyll
git checkout master _build/html
mv ./_build/html/* ./
rm -rf ./_build/
git add -A
git commit -m "publishing updated docs..."
sleep 30
git push origin gh-pages
# switch back
git checkout master