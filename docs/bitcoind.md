## Prepare bitcoind

1. create bitcoin directory and config file
```
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
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
```

## Run bitcoind
```
bitcoind -datadir=/path/to/bitcoin
```

## Run bitcoind as a daemon process
```
bitcoind -datadir=/path/to/bitcoin -daemon
```
