#!/bin/bash
#install.sh

cd
mkdir log 
echo "[install]error log : log/installerror.log"
sh eosdependency.sh 2> installerror.log
sh reinstall.sh 2>> installerror.log

