#!/bin/zsh

echo "Enter the Ada source filename (must end with .adb):"
read filename

if [[ "$filename" == *.adb ]]; then
    docker run --rm -v "$PWD":/code:ro esolang/ada ada /code/"$filename"
else
    echo "Error: Filename must end with .adb"
    exit 1
fi