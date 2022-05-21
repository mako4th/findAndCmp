#!/bin/bash

#Find files and sort.
test -f log && rm log

#types=("jpg")
#for type in ${types[@]}; do
find $1 -type f -ls | cut -w -f7 -f11 | tr "[:blank:]" ":" >tmp
#done

cat tmp | cut -d ":" -f1 |  sort -n -k1 | uniq >tmp2 

while read size;do
	line=($(grep ^${size} tmp))
	count=$(expr ${#line[@]} - 1) 
	i=0
	j=0
	while [ $i -lt $count ];do
		j=$(expr $i + 1)
		while [ $j -le $count ];do
	  		lfile=$(echo ${line[${i}]} | cut -d ":" -f2)
			rfile=$(echo ${line[${j}]} | cut -d ":" -f2)
			cmp -s "$lfile" "$rfile"
			test $? -eq 0 && issame="____samefile____" 
			test $? -eq 1 && issame="____difffile____" 
			echo "$lfile" and "$rfile" "$issame" | tee log 
			j=`expr $j + 1`
		done
		i=`expr $i + 1`
	done
done <tmp2
rm tmp tmp2
