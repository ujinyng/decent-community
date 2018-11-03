#!/bin/bash
#voteconfig.sh

eosiocpp -o vote.wast vote.cpp && eosiocpp -g vote.abi vote.cpp && echo "[voteconfig]create vote.wast & vote.abi"

cleos create key -f eosio.vote-key && sed -i 's/ //g' eosio.vote-key && sed -i 's/://g' eosio.vote-key && sed -i 's/Privatekey//g' eosio.vote-key && sed -i 's/Publickey//g' eosio.vote-key && echo "[voteconfig]create key for eosio.vote."

voteprv=$(sed -n 1p eosio.vote-key)
votepub=$(sed -n 2p eosio.vote-key)

cleos wallet import --private-key $voteprv && echo "[voteconfig]saving private key" && cd eoscontract && cleos create account eosio eosio.vote $votepub && echo "[voteconfig]create eosio.vote account"
cleos set contract eosio.vote ~/eoscontract/vote -p eosio.vote@active && ehco "[voteconfig]set vote contract"

