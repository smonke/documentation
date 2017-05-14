#!/usr/bin/env bash
# build the docs
make clean
make html
# commit and push
git add -A
git commit -m "building and pushing docs"
git push origin master
# switch branches and pull the data we want
sleep 10
git checkout gh-pages -f
sleep 20
rm -rf .
touch .nojekyll
git checkout master _build/html
mv ./_build/html/* ./
rm -rf ./_build/
git add -A
git commit -m "publishing updated docs..."
sleep 10
git push origin gh-pages
# switch back
git checkout master -f