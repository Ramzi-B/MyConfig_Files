#!/bin/bash

timestamp="$(date +%Hh%Mm%Ss%d-%m-%Y)"
targetbase="$HOME/screenshot2"

if [ ! -e $targetbase ]; then
    mkdir $targetbase
fi

[ -d $targetbase ] || exit 1
scrot $targetbase/$timestamp.png
