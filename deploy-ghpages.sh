#!/bin/bash

set -ex

cd dist || exit 1;

if  [ "$TRAVIS" = "true" -a "$TRAVIS_PULL_REQUEST" = "false"  -a "$TRAVIS_BRANCH" = "master" ]
  then
    (
     cp ../CNAME ./CNAME
     git init
     git config user.name "Travis-CI"
     git config user.email "travis@example.org"
     git add .
     git commit -m "Deployed to Github Pages"
     #git push --force --quiet "git@github.com:${TRAVIS_REPO_SLUG}" master:gh-pages > /dev/null 2>&1
     git push --force "git@github.com:${TRAVIS_REPO_SLUG}" master:gh-pages
    )
fi
