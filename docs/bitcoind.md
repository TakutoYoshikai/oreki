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

## Stop bitcoind
```
bitcoin-cli stop
```
## Setup LND
1. create lnd directory
```
mkdir lnd
cd lnd
mkdir data
mkdir logs
```

2. create a shell script for running lnd
```
vim run-lnd.sh
chmod +x run-lnd.sh
```

this is an example of run-lnd.sh on testnet (for test)
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.testnet --bitcoin.active
```

this is an example of run-lnd.sh on mainnet(for production)

```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/logs --debuglevel=info --bitcoin.node=bitcoind --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --bitcoind.rpcuser=alice --bitcoind.rpcpass=alicepassword --bitcoin.mainnet
```
## Run LND
```
./run-lnd.sh
```

## Run LND in background
```
nohup ./run-lnd.sh &
```

### Stop LND process in background
```
lncli stop
```
