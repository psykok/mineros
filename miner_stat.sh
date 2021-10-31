#!/bin/bash


source .private
RES=`echo '{"id":1,"jsonrpc":"2.0","method":"miner_getstatdetail"}' | netcat -N localhost 3333|jq -r '.result.devices[]|._index,.mining.hashrate'| sed 'N;s/\n/,/'`


for line in $RES
do
	index=`echo $line|cut -d ',' -f 1`
	hashrate_hex=`echo $line|cut -d ',' -f 2`
	hashrate=$((${hashrate_hex}))

        curl -i -XPOST "http://${INFLUX_HOST}:8086/write?db=${INFLUX_DB}&u=${INFLUX_USER}&p=${INFLUX_PWD}" --data-binary "gpu,index=$index hasrate=$hashrate"


done
