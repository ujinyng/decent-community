#!/bin/bash
#eosdependency.sh

echo "[eosdependency]sudo apt-get update"
sudo apt-get update 
echo "[eosdependency]install the development toolkit"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - 
sudo apt-get install clang-4.0 lldb-4.0 libclang-4.0-dev cmake make \ 
                     libbz2-dev libssl-dev libgmp3-dev libsasl2-dev \ 
                     libmongoc-1.0.0 libbson-1.0 autotools-dev build-essential \ 
                     libbz2-dev libicu-dev python-dev \ 
                     autoconf libtool git mongodb
echo "[eosdependency]install boost 1.66"
  
cd ~ 
wget -c 'https://sourceforge.net/projects/boost/files/boost/1.66.0/boost_1_66_0.tar.bz2/download' -O boost_1.66.0.tar.bz2 
tar xjf boost_1.66.0.tar.bz2 
cd boost_1_66_0/
echo "export BOOST_ROOT=$HOME/boost_1_66_0" >> ~/.bashrc
source ~/.bashrc
./bootstrap.sh "--prefix=$BOOST_ROOT" 
./b2 install 
source ~/.bashrc

echo "[eosdependency]add path"
echo "export PATH=$PAHT:~/eos/build/programs/cleos:~/eos/build/programs/keosd:~/eos/build/programs/nodeos:~/eos/tools/" >> .bashrc 
source ~/.bashrc

echo "[eosdependency]install mongo-cxx-driver 1.10.0"

cd ~ 
curl -LO https://github.com/mongodb/mongo-c-driver/releases/download/1.10.0/mongo-c-driver-1.10.0.tar.gz 
tar xf mongo-c-driver-1.10.0.tar.gz 
cd mongo-c-driver-1.10.0 
mkdir cmake-build
cd cmake-build
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. 
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DENABLE_BSON=ONLY .. 
make -j$( nproc ) 
sudo make install

git clone https://github.com/mongodb/mongo-cxx-driver.git --branch releases/stable --depth 1 
cd mongo-cxx-driver/build
cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .. 
sudo make -j$( nproc ) 

echo "[eosdependency]insatll secp256k1-zkp"
cd ~ 
git clone https://github.com/cryptonomex/secp256k1-zkp.git 
cd secp256k1-zkp 
./autogen.sh 
./configure 
make 
sudo make install 

echo "[eosdependency]install WASM"
mkdir ~/wasm-compiler
cd ~/wasm-compiler  
git clone --depth 1 --single-branch --branch release_40 https://github.com/llvm-mirror/llvm.git 
cd llvm/tools 
git clone --depth 1 --single-branch --branch release_40 https://github.com/llvm-mirror/clang.git 
cd .. 
mkdir build 
cd build 
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=.. -DLLVM_TARGETS_TO_BUILD= -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly -DCMAKE_BUILD_TYPE=Release ../ 
make -j4 install

echo "[eosdependency]Next, Please install the EOSIO"


