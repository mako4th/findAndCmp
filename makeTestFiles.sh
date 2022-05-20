#!/bin/bash

dirname=testFiles

test -d ${dirname} && rm -rf ${dirname}
mkdir ${dirname}

for i in {0..100}
do

dd if=/dev/random of=${dirname}/file$i count=$RANDOM

done

for i in {0..10}
do
	filename=file$((RANDOM%100)) 
	cp ${dirname}/$filename ${dirname}/filename_$i
done
