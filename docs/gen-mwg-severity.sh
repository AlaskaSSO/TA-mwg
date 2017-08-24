#!/bin/sh
echo rep,severity,type
for i in $(seq -127 15)
do
	echo "$i,informational,webevent"
done
for i in $(seq 16 29)
do
	echo "$i,low,webevent"
done
for i in $(seq 30 49)
do
	echo "$i,medium,webevent"
done
for i in $(seq 50 85)
do
	echo "$i,high,webevent"
done
for i in $(seq 86 127)
do
	echo "$i,critical,webevent"
done
