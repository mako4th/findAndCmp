#!/bin/bash

#Find files and sort.
types=("jpg" "png")
for type in ${types[@]}
do
    find $1 -type f -name "*\.${type}" -ls >>tmp
done

sort -n -k1 tmp>tmp2
