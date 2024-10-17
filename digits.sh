#!/bin/bash
num=0
for i in {1000..2000}; do
    if [[ $i =~ ^[01]+$ ]]; then
        num=$((num + i))
    fi
done
echo " the sum of the numbers: $num"