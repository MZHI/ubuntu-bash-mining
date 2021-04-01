#!/bin/bash

screen -d -m -S mining bash -c "ethminer -P stratum1+tcp://[etherium address]%2e1@eth-eu1.nanopool.org:9999"
