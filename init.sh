#!/bin/bash
#init.sh

echo "[init]error log : log/initerror.log"
sh eosinit.sh 2> initerror.log
sh voteconfig.sh 2>> initerror.log  
