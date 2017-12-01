#!/bin/bash
#not tested with 123456789, not enough memory for array

OUTPUTFILE="results.txt"
> $OUTPUTFILE

FILE="primFast.lua"
for i in 1 12 123 1234 12345 123456 1234567 12345678;do
	echo "$FILE" >> $OUTPUTFILE
	echo "Test value: $i" >> $OUTPUTFILE
	time (lua "$FILE" $i > /dev/null) 2>> $OUTPUTFILE 
done

FILE="primFast.luajit"
for i in 1 12 123 1234 12345 123456 1234567 12345678;do
        echo "$FILE" >> $OUTPUTFILE
	echo "Test value: $i" >> $OUTPUTFILE
	time (luajit "$FILE" $i > /dev/null) 2>> $OUTPUTFILE           
done

FILE="primFast.py"
for i in 1 12 123 1234 12345 123456 1234567 12345678;do
        echo "$FILE" >> $OUTPUTFILE
	echo "Test value: $i" >> $OUTPUTFILE
	time (python3 "$FILE" $i > /dev/null) 2>> $OUTPUTFILE           
done

FILE="primFast.sh"
for i in 1 12 123 1234 12345 123456;do
        echo "$FILE" >> $OUTPUTFILE
	echo "Test value: $i" >> $OUTPUTFILE
	time (bash "$FILE" $i > /dev/null) 2>> $OUTPUTFILE           
done
