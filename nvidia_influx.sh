#!/bin/bash
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
source $SCRIPTPATH/.private

RES_HASH=`echo '{"id":1,"jsonrpc":"2.0","method":"miner_getstatdetail"}' | netcat -N localhost 3333|jq -r '.result.devices[]|._index,.mining.hashrate'| sed 'N;s/\n/,/'`


QUERY="index,uuid,name,power.draw,temperature.gpu,clocks.current.sm,clocks.mem,fan.speed"
QUERYARRAY=`echo ${QUERY}| tr ',' ' '`

IFS=$'\n'
nb=0
res=""
for line in `nvidia-smi --query-gpu=${QUERY} --format=csv,nounits,noheader`
do
	IFS=$','

	DATA=(${line})
	for tag in $QUERY
	do
	  if [[ nb -eq 0 ]]
          then
		  INDEX=`echo ${DATA[$nb]}|sed 's/ //'`
	  elif [[ nb -eq 1 ]]
          then
		  UUID=`echo ${DATA[$nb]}|sed 's/ //'`
	  elif [[ nb -eq 2 ]]
          then
		  GPUNAME=`echo ${DATA[$nb]}|sed 's/^ //'|tr ' ' '_'`
          else
	   res+="$tag=`echo ${DATA[$nb]}|sed 's/^ //'`,"
	  fi
	 ((nb=nb+1))
	done
        echo echo ${RES_HASH}	
        hashrate_hex=`echo ${RES_HASH}|grep ^${INDEX}|cut -d ' ' -f 2`	
        echo "###$hashrate_hex###"
	hashrate_dec=$((${hashrate_hex}))
        res+="hashrate=${hashrate_dec},"

	IFS=
	echo $res

	curl -i -XPOST "http://${INFLUX_HOST}:8086/write?db=${INFLUX_DB}&u=${INFLUX_USER}&p=${INFLUX_PWD}" --data-binary "gpu,index=$INDEX,uuid=$UUID,name=${INDEX}_${GPUNAME} `echo $res|sed 's/,$//'`"
        nb=0 
	res=""
done

