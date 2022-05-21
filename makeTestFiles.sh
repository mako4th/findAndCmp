#!/bin/bash

dirname=testFiles

test -d ${dirname} && rm -rf ${dirname}
mkdir ${dirname}

for i in {0..30}; do
dd if=/dev/random of=${dirname}/file$i count=$RANDOM
done

for i in {0..5}; do
	filename=file$((RANDOM%30)) 
	cp ${dirname}/$filename ${dirname}/file_$i
done
