#!/bin/bash
# check the num of parameter
# usage statement, to stderr
if [[ $# -ne 2 ]]; then
    echo "usage: $0 <dir> <n>" 1>&2 
    exit 1
fi 
dir=$1
size=$2
if [[ ! -d "$dir" ]]; then
    echo "Error: Directory $dir does not exist." 1>&2
    exit 1
fi
find "$dir" -type f -size +"${size}c" -exec rm {} \;
echo "Removed all files larger than $size bytes in directory $dir."