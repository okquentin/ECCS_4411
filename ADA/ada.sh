#!/bin/zsh

usage() {
    echo "Usage: $0 <filename.adb>"
    echo "       $0 -i <filename.adb> <filename.txt>"
    echo "       $0 -d (open a debug shell in the container)"
    echo "       $0 -h"
}

docker_cmd='docker run --rm -v "$PWD":/code:ro esolang/ada ada /code/<filename.adb>'
docker_cmd_input='docker run -i --rm -v "$PWD":/code:ro esolang/ada ada /code/<filename.adb> < <filename.txt>'
docker_cmd_shell='docker run -it --rm -v "$PWD":/code:ro esolang/ada sh'

if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

if [[ "$1" == "-h" ]]; then
    echo ""
    echo "Runs the following command:"
    echo "$docker_cmd"
    echo ""
    echo "Or with input:"
    echo "$docker_cmd_input"
    echo ""
    echo "Or open a shell in the container:"
    echo "$docker_cmd_shell"
    echo "Usage: ada /code/<filename>.adb"
    echo ""
    echo "NOTE: Docker Desktop must be running."
    exit 0
fi

if [[ "$1" == "-d" ]]; then
    docker run -it --rm -v "$PWD":/code:ro esolang/ada sh
    exit 0
fi

if [[ "$1" == "-i" ]]; then
    if [[ $# -ne 3 ]]; then
        usage
        exit 1
    fi
    filename="$2"
    inputfile="$3"
    if [[ "$filename" == *.adb && "$inputfile" == *.txt ]]; then
        docker run -i --rm -v "$PWD":/code:ro esolang/ada ada /code/"$filename" < "$inputfile"
    else
        echo "Error: Filename must end with .adb and input file must end with .txt"
        usage
        exit 1
    fi
else
    filename="$1"
    if [[ "$filename" == *.adb ]]; then
        docker run --rm -v "$PWD":/code:ro esolang/ada ada /code/"$filename"
    else
        echo "Error: Filename must end with .adb"
        usage
        exit 1
    fi
fi