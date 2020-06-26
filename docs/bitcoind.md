## Prepare bitcoind

1. create bitcoin directory and config file
```bash
mkdir bitcoin
cd bitcoin
vim bitcoin.conf
```
this is an example of bitcoin.conf on testnet(for test)
```
testnet=3
rest=1
server=1
txindex=1
rpcuser=alice <- Change HERE
rpcpassword=alicepassword <- Change HERE
rpcport=18332
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
```

this is an example of bitcoin.conf on mainnet(for production)
```
rest=1
server=1
txindex=1
rpcuser=alice <- Change HERE
rpcpassword=alicepassword <- Change HERE
rpcport=18332
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
```
## Register alias in ~/.bash_profile
insert this to .bash_profile
```
alias mybitcoin-cli="bitcoin-cli -rpcport=18332 -rpcuser=alice -rpcpassword=alicepassword"
```
## Start bitcoind
First start of bitcoind have to wait sync of blockchain.
You can know blockchain sync finished by checking log and comparing to [latest block height](https://live.blockcypher.com/btc/)
```bash
bitcoind -datadir=/path/to/bitcoin
```

## Start bitcoind as a daemon process
```bash
bitcoind -datadir=/path/to/bitcoin -daemon
```

## Check bitcoind info(when you check blockchain height)
```
mybitcoin-cli -getinfo
```

## When you want to stop bitcoind
```bash
mybitcoin-cli stop
```
## Setup LND
**1. create lnd directory**
```bash
mkdir lnd
cd lnd
mkdir data
mkdir logs
```

**2. create a shell script for starting lnd**
```bash
vim start-lnd.sh
chmod +x start-lnd.sh
```

this is an example of start-lnd.sh on testnet (for test)
```bash
#!/bin/bash
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.testnet --bitcoin.active
```

this is an example of start-lnd.sh on mainnet(for production)

```bash
#!/bin/bash
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.mainnet --bitcoin.active
```

**3. register alias of lncli in .bash_profile**

* for test
```bash
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/data/chain/bitcoin/testnet/admin.macaroon"
```

* for production
```bash
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/data/chain/bitcoin/mainnet/admin.macaroon"
```
## Start LND
```bash
./start-lnd.sh
```

## Start LND in background
```bash
nohup ./start-lnd.sh &
```
### When you want to stop LND process in background
```bash
mylncli stop
```

### Create your Lightning Network Wallet
```bash
mylncli create
```

### When move coin from LND to your bitcoin wallet
```bash
mylncli unlock
mylncli sendcoins --addr <your bitcoin address> --amt <amount satoshi> --conf_target 19
```
