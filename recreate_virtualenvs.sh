#!/bin/bash

export VIRTUALENV_PYTHON=python3
export VIRTUALENVWRAPPER_PYTHON=python3
. virtualenvwrapper.sh

cd /Users/florent.delannoy/projects/

for REQ in */requirements.txt
do
    ENV_NAME=$(echo $REQ | sed "s#/requirements.txt##")

    echo "Deleting $ENV_NAME..."
    rmvirtualenv $ENV_NAME

    echo "Recreating $ENV_NAME..."
    mkvirtualenv $ENV_NAME
    pip install -r $REQ

    deactivate
done
