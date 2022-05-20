#!/bin/bash

#Find files and sort.
#IFS=$'\n'

#types=("jpg")
#for type in ${types[@]}; do
find $1 -type f -ls | cut -w -f7- >tmp
#done

cat tmp | cut -w -f 1 |  sort -n -k1 | uniq >tmp2 

while read size;do
  i=0
  j=0
  line=($(grep ^${size} tmp))
  echo "${line[@]}"
done <tmp2

