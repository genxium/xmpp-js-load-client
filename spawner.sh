#!/bin/bash

# Tune the `interval` to get the best connection rate. Please note that there're many variables, e.g. OS settings, node vm settings and hardware specs which could affect the connection rate, thus the optimal `interval` remains to be tuned.

if [ $# -ne 6 ]; then
	echo "Usage: $0 <domain> <server address> <port> <st> <ed> <interval>"
	exit 1
fi

basedir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

domain=$1
serveraddr=$2
port=$3
st=$4
ed=$5
interval=$6

for i in `seq $st $interval $ed`
	do
		edi=$(( $i+$interval-1 ))
		node $basedir/multi_conn.js $domain $serveraddr $port $i $edi > /dev/null 2>&1 & 
	done
