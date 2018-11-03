#!/bin/bash
#reinstall.sh

# remove possibly existent old file

echo "[reinstall]remove old file"
cd ~/eos
sh eosio_uninstall.sh
cd
rm -rf eos
sudo rm -rf /usr/local/bin/eosiocpp && sudo rm -rf /usr/local/eosio 
rm -rf eosio-wallet
rm -rf .local/share/eosio

echo "[reinstall]install new eosio"

mkdir eos
cd eos
git clone https://github.com/EOSIO/eos.git
sh eosio_build.sh
cd build && sudo make install
