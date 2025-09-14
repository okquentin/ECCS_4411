#!/bin/zsh

usage() {
    echo "Usage: $0 <filename.adb>"
    echo "       $0 -h"
}

docker_cmd='docker run --rm -v "$PWD":/code:ro esolang/ada ada /code/<filename.adb>'

if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

if [[ "$1" == "-h" ]]; then
    echo ""
    echo "Runs the following command:"
    echo "$docker_cmd"
    echo ""
    echo "NOTE: Docker Desktop must be running."
    exit 0
fi

filename="$1"

if [[ "$filename" == *.adb ]]; then
    docker run --rm -v "$PWD":/code:ro esolang/ada ada /code/"$filename"
else
    echo "Error: Filename must end with .adb"
    usage
    exit 1
fi