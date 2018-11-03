#!/bin/bash
#start.sh
killall keosd
killall nodeos

echo "[eosstart]save to log/nodeos.log"
echo "[eosstart]nodeos start.. Please wait.." && nohup nodeos -e -p eosio --private-key '["EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"]' --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --replay-blockchain --hard-replay-blockchain –contracts-console > log/nodeos.log

