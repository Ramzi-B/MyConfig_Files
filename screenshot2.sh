#!/bin/bash

timestamp="$(date +%H%M%S%d%m%Y)"
targetbase="$HOME/screenshot2"

if [ ! -e $targetbase ]; then
    mkdir $targetbase
fi

[ -d $targetbase ] || exit 1
scrot $targetbase/$timestamp.png
