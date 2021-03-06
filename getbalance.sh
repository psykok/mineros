#/bin/bash
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
echo $SCRIPTPATH/.private
source /home/psykok/git/mineros/.private

echo $SCRIPTPATH
echo curl -s -d "module=account&action=balance&address=${WALLET}&tag=latest&apikey=${API_KEY}" -X POST https://api.etherscan.io/api
res=`curl -s -d "module=account&action=balance&address=${WALLET}&tag=latest&apikey=${API_KEY}" -X POST https://api.etherscan.io/api`
balance=`echo $res|jq -r '.result'`

stats=`curl -s -X GET "https://api.ethermine.org/poolStats"`
price=`echo ${stats}|jq -r '.data.price.eur'`
gas=`echo ${stats}|jq -r '.data.estimates.gasPrice'`

echo $balance
echo $price
echo $gas
echo curl -i -XPOST "http://${INFLUX_HOST}:8086/write?db=${INFLUX_DB}&u=${INFLUX_USER}&p=${INFLUX_PWD}" --data-binary "wallet balance=${balance}"
curl -i -XPOST "http://${INFLUX_HOST}:8086/write?db=${INFLUX_DB}&u=${INFLUX_USER}&p=${INFLUX_PWD}" --data-binary "wallet balance=${balance}"
curl -i -XPOST "http://${INFLUX_HOST}:8086/write?db=${INFLUX_DB}&u=${INFLUX_USER}&p=${INFLUX_PWD}" --data-binary "ether price=${price},gas=${gas}"
