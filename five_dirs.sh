#!/bin/bash


# mkdir five


# for i in {1..5}; do
#     mkdir five/dir$i

# mkdir test_area/five
mkdir -p ./five

for i in {1..5}; do
    mkdir -p ./five/dir$i    

    for j in {1..4}; do

        for ((k=1; k<=j; k++)); do
            echo $j >> five/dir$i/file$j
        done
    done
done
