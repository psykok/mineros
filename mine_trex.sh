#!/bin/bash

ETHBIN=~/trex/t-rex

source .private

${ETHBIN}  -a ethash -o stratum+tcp://eu1.ethermine.org:4444 -u ${WALLET} -w `hostname -s`

