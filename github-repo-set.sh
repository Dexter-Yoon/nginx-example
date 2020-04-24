#!/bin/bash
# Set your GitHub username and email
export GITHUB_USERNAME="DragOnMe"
export GITHUB_EMAIL="dragonme@gmail.com"

git config --global user.name "${GITHUB_USERNAME}"
git config --global user.email "${GITHUB_EMAIL}"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

curl -u "${GITHUB_USERNAME}" https://api.github.com/user/repos -d '{"name":"test-webapp"}'

echo "# test-webapp" > README.md
git init
git add .
git commit -a -m "Create test-webapp repository"
git remote add origin https://github.com/${GITHUB_USERNAME}/test-webapp.git
git push -u origin master
