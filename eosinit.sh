#!/bin/bash
#eosinit.sh

cleos wallet create -f default && echo "[eosinit]create new wallet" 

while read line; do
  echo $line
 done < default
cleos wallet unlock --password $line && echo "Unlock" $walletname "wallet" && cleos set contract eosio ~/eos/build/contracts/eosio.bios -p eosio@active && echo "[eosinit]set eosio.bios contract"
cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cleos create account eosio eosio.token && cleos set contract eosio.token ~/eos/build/contracts/eosio.token -p eosio.token@active && echo "[eosinit]create & set eosio.token contract"
