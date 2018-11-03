#### os : ubuntu 16.04 
#### nodeos version : v1.2.0

## 실행방법

### 1. eos dependency, eosio 설치 및 vote contract 배포

```sh install.sh```

```sh init.sh```

#### eosio, eosio.token, eosio.vote 계정 생성 명령어 포함

### 2. Nodeos 시작 및 커뮤니티 생성

```sh start.sh```

```sh newcom.sh```

### 3. 토큰 기능

#### 토큰 발행 및 배분

```cleos push action eosio.token create '["studygroup1","100000000 BCT"]' -p eosio.token@active```

```cleos push action eosio.token issue '["studygroup1", "150000 BCT", "memo"]' -p studygroup1@active```

```cleos push action eosio.token transfer '["studygroup1", "mem1", "30000 BCT",""]' -p studygroup1@active``` 

#### 토큰 잔액 확인

```cleos get currency balance eosio.token community1 CMT```

```cleos get currency balance eosio.token mem1 CMT```

#### 토큰 전송

```cleos transfer mem1 mem2 "10000 CMT"``` 

### 4. 투표 기능
 
#### 투표 생성

```cleos push action mem2 addpoll '["mem2","newmember"]' -p mem2@active –j –d```
```cleos push action mem2 addpollopt '["newmember","agree"]' -p mem2@active```
```cleos push action mem2 addpollopt '["newmember","disagree"]' -p mem2@active```
```cleos push action mem2 status '["newmember"]' -p mem2@active –j -d```

#### 투표 참여

```cleos push action mem2 vote ['newmember','agree','mem2'] -p mem2@active```

#### 투표 결과 확인(진행 확인)

```cleos push action mem1 status['newmember'] -p mem1@active```

### 5. 그룹 계정 관리

추후 추가할 예정(multisig 등)

## 기타 설정
### nodeos설정파일 위치 (config.ini)

```cd ~/.local/share/eosio/nodeos/config```

```vi config.ini```

### keosd설정파일 위치 (config.ini)

```cd ~/eosio-wallet```

```vi config.ini```





