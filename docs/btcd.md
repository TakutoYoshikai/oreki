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
You can know blockchain sync finished by checking log and comparing to [latest block height](https://live.blockcypher.com/btc/)
```
./start-btcd.sh
```

## Start btcd in background
```
nohup ./start-btcd.sh &
```
