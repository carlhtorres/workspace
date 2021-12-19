#!/usr/bin/env bash

PROJECT_HOME=$(pwd)/projects

git config --global user.email "carloshenriquetorress@gmail.com"
git config --global user.name "Carlos Henrique Torres Silva"

# TODO: check if I can use github REST API
function git_clone() {
    for prj in $(cat projects.list)
    do
        git clone git@github.com:carlhtorres/${prj} ${PROJECT_HOME}/${prj}
    done
}

function git_sync() {
    for prj in $(cat projects.list)
    do
        cd ${PROJECT_HOME}/${prj}
        git push origin master
        cd -
    done
}

echo "I can be greatly improved, even migrated to Python in the future!"
echo "Don't leave me to dust!"

git_clone
