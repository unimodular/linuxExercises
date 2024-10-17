#!/bin/bash

if [ $# -lt 1 ]; then
  echo "usage: ./mean.sh <column> [file.csv]" 1>&2
  exit 1
fi

column=$1

file=${2:-/dev/stdin}

cut -d',' -f"$column" "$file" | tail -n +2 | {
  sum=0
  count=0

  while read value; do
    sum=$(echo "$sum + $value" | bc)
    count=$((count + 1))
  done

  if [ "$count" -gt 0 ]; then
    mean=$(echo "scale=2; $sum / $count" | bc)
    echo "Mean: $mean"
  else
    echo "No data in column" >&2
    exit 1
  fi
}
