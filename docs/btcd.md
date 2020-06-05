## Prepare btcd

1. create btcd directory
```
mkdir btcd
```

## Make startup script of btcd
```
vim start-btcd.sh
chmod +x start-btcd.sh
```

this is an example of start-btcd.sh on testnet(for test)
```
#!/bin/bash
btcd --testnet --txindex --rpcuser=alice --rpcpass=alice01 --datadir=/path/to/btcd/data
```

## Start btcd
First start of btcd have to wait sync of blockchain.
You can know blockchain sync finished by checking log and comparing to [latest block height](https://live.blockcypher.com/btc/) or [latest block height of testnet(for test)](https://live.blockcypher.com/btc-testnet/)
```
./start-btcd.sh
```

## Start btcd in background
```
nohup ./start-btcd.sh &
```

## Stop btcd
for test
```
btcctl --testnet -u alice -P alice01 stop
```

## Setup LND
1. create lnd directory
```
mkdir lnd
cd lnd
mkdir data
mkdir logs
```

2. create a shell script for starting lnd
```
vim start-lnd.sh
chmod +x start-lnd.sh
```

this is an example of start-lnd.sh on testnet (for test)
```
lnd --rpclisten=localhost:10001 --listen=localhost:10011 --restlisten=localhost:8001 --datadir=/path/to/lnd/data --logdir=/path/to/lnd/log --debuglevel=info --bitcoin.node=btcd --bitcoin.active --btcd.rpcuser=alice --btcd.rpcpass=alice01 --bitcoin.testnet
```

3. register alias of lncli in .bash_profile

* for test
```
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/chain/bitcoin/testnet/admin.macaroon"
```

* for production
```
alias mylncli="lncli --rpcserver=localhost:10001 --macaroonpath=/path/to/lnd/chain/bitcoin/mainnet/admin.macaroon"
```
## Start LND
```
./start-lnd.sh
```

## Start LND in background
```
nohup ./start-lnd.sh &
```
### Stop LND process in background
```
mylncli stop
```

### Create your Lightning Network Wallet
```
mylncli create
```

### When move coin from LND to your bitcoin wallet
```
mylncli unlock
mylncli sendcoins --addr <your bitcoin address> --amt <amount satoshi> --conf_target 19
```



