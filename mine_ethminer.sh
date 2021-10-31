#!/bin/bash

ETHBIN=${HOME}/git/ethminer/build/ethminer/ethminer

source .private

WORKERNAME=`hostname -s`
#
# SSL Pool
#
SSLPOOL=stratum1+ssl://${WALLET}.${WORKERNAME}@eu1.ethermine.org:5555
POOL=stratum1+tcp://${WALLET}.${WORKERNAME}@eu1.ethermine.org:4444
POOL1=stratum1+tcp://${WALLET}.${WORKERNAME}@eu1.ethermine.org:14444


${ETHBIN} -U -P ${SSLPOOL} --response-timeout 30 --api-bind 127.0.0.1:3333 --report-hr
