#!/bin/bash
#newcom.sh

echo "[newcom]starting to create wallet for community..." && echo -n "[newcom]wallet name: "
read walletname

if [ -e $walletname ]
 then echo $walletname "[newcom]already exists. Please use another name." && exit
else 
 cleos wallet create -n $walletname -f $walletname && echo "[newcom]create new wallet" # && cleos set contract eosio ~/eos/build/contracts/eosio.bios -p eosio@active
fi

if [ -e $walletname ]
then 
 while read line; do
  echo $line
 done < $walletname
else echo "[newcom]cannot open" $walletname
fi
#cleos wallet unlock -n $walletname --password $line && echo "Unlock" $walletname "wallet" 

echo -n "[newcom]account name:"
read accountname

if [ -e $accountname ]
 then echo $accountname "[newcom]already exists. Please use another name." && exit
else
 echo "[newcom]create key for first member." && cleos create key -f ${accountname}-key && sed -i 's/ //g' ${accountname}-key && sed -i 's/://g' ${accountname}-key && sed -i 's/Privatekey//g' ${accountname}-key && sed -i 's/Publickey//g' ${accountname}-key
fi

echo "[newcom]save the keys"
prvkey=$(sed -n 1p ${accountname}-key)
pubkey=$(sed -n 2p ${accountname}-key)

echo "[newcom]import default key"
cleos wallet import -n $walletname --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

#cleos create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV && cleos set contract eosio.token ~/eos/build/contracts/eosio.token -p eosio.token@active

cleos wallet import -n $walletname --private-key $prvkey && echo "[newcom]saving private key to" $walletname && cleos create account eosio $accountname $pubkey && echo "[newcom]create first member account" 

