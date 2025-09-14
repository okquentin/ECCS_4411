#!/bin/zsh


usage() {
    echo "Usage: $0 <filename.bf>"
    echo "       $0 -h"
}

docker_cmd="docker run --rm -v \"\$PWD\":/code:ro esolang/brainfuck-bfi brainfuck-bfi /code/<filename.bf>"

if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

if [[ "$1" == "-h" ]]; then
    echo ""
    echo "Runs the following command:"
    echo "$docker_cmd"
    echo ""
    echo "NOTE: Docker Desktop must be running:"
    exit 0
fi

filename="$1"

if [[ "$filename" == *.bf ]]; then
    docker run --rm -v "$PWD":/code:ro esolang/brainfuck-bfi brainfuck-bfi /code/"$filename"
else
    echo "Error: Filename must end with .bf"
    usage
    exit 1
fi